#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

"$repo_root/scripts/verify-workflows.sh"

formula_path="$repo_root/Formula/chilly.rb"
tap_name="${CHILL_TAP_VERIFY_TAP:-chill-institute/harness-verify-local}"
formula_ref="$tap_name/chilly"
temp_repo=''

installed_by_script=0
export HOMEBREW_NO_AUTO_UPDATE="${HOMEBREW_NO_AUTO_UPDATE:-1}"
umask 022

cleanup() {
  if [[ "$installed_by_script" == "1" ]] && [[ "${CHILL_TAP_KEEP_INSTALLED:-0}" != "1" ]]; then
    brew uninstall --formula "$formula_ref" >/dev/null 2>&1 || true
  fi

  brew untap "$tap_name" >/dev/null 2>&1 || true

  if [[ -n "$temp_repo" ]]; then
    rm -rf "$temp_repo"
  fi
}

trap cleanup EXIT

chmod 0644 "$formula_path"

printf '==> checking formula style\n'
brew style "$formula_path"

temp_repo="$(mktemp -d)"
mkdir -p "$temp_repo/Formula"
cp "$formula_path" "$temp_repo/Formula/chilly.rb"
chmod 0644 "$temp_repo/Formula/chilly.rb"
git -C "$temp_repo" init -q
git -C "$temp_repo" add Formula/chilly.rb
git -C "$temp_repo" -c user.name='Harness' -c user.email='harness@chill.institute' commit -qm 'tap snapshot'

brew untap "$tap_name" >/dev/null 2>&1 || true

printf '==> tapping %s from a temporary repo snapshot\n' "$tap_name"
brew tap "$tap_name" "$temp_repo" >/dev/null

printf '==> auditing formula\n'
brew audit --strict "$formula_ref"

printf '==> checking every archive against its formula sha256\n'
archives="$(
  ruby -e 'File.read(ARGV[0]).scan(/url "([^"]+)"\s*\n\s*sha256 "([0-9a-f]{64})"/) { |url, sum| puts "#{sum} #{url}" }' "$formula_path"
)"
if [[ -z "$archives" ]] || [[ "$(wc -l <<<"$archives")" -ne "$(grep -c '^ *url "' "$formula_path")" ]]; then
  printf 'every url in %s needs a sha256 on the next line\n' "$formula_path" >&2
  exit 1
fi
release_prefix='https://github.com/chill-institute/chill-cli/releases/download/v'
release_version=''
while read -r _ url; do
  version="${url#"$release_prefix"}"
  version="${version%%/*}"
  if [[ "$url" != "$release_prefix"* ]] || [[ -z "$version" ]] || [[ "$url" != "$release_prefix$version/"* ]]; then
    printf '%s is not a chill-cli release download\n' "$url" >&2
    exit 1
  fi
  if [[ -z "$release_version" ]]; then
    release_version="$version"
  elif [[ "$version" != "$release_version" ]]; then
    printf '%s is from v%s; other archives are from v%s\n' "$url" "$version" "$release_version" >&2
    exit 1
  fi
done <<<"$archives"

mismatch=0
while read -r expected url; do
  actual="$(curl --fail --location --silent --show-error --retry 5 --retry-all-errors "$url" | shasum -a 256 | cut -d ' ' -f 1)"
  if [[ "$actual" != "$expected" ]]; then
    printf '%s has sha256 %s; the formula expects %s\n' "$url" "$actual" "$expected" >&2
    mismatch=1
  else
    printf 'ok %s\n' "$url"
  fi
done <<<"$archives"
if [[ "$mismatch" != 0 ]]; then
  exit 1
fi

if [[ "${CHILL_TAP_INSTALL_SMOKE:-0}" != "1" ]]; then
  printf '==> skipping install smoke; set CHILL_TAP_INSTALL_SMOKE=1 to exercise the formula test block\n'
  exit 0
fi

formula_url="$(
  brew info --json=v2 "$formula_ref" |
    ruby -rjson -e 'puts JSON.parse(STDIN.read).fetch("formulae").fetch(0).fetch("urls").fetch("stable").fetch("url")'
)"
printf '==> waiting for release artifact\n'
curl \
  --fail \
  --head \
  --location \
  --retry 24 \
  --retry-all-errors \
  --retry-delay 5 \
  --retry-max-time 120 \
  --show-error \
  --silent \
  "$formula_url" >/dev/null

if brew list --formula chilly >/dev/null 2>&1; then
  if [[ "${CHILL_TAP_ALLOW_REINSTALL:-0}" != "1" ]]; then
    printf '==> skipping install smoke because chilly is already installed locally; set CHILL_TAP_ALLOW_REINSTALL=1 to force a reinstall\n'
    exit 0
  fi

  printf '==> reinstalling %s for smoke test\n' "$formula_ref"
  brew reinstall --formula "$formula_ref"
else
  printf '==> installing %s for smoke test\n' "$formula_ref"
  brew install --formula "$formula_ref"
  installed_by_script=1
fi

printf '==> running formula test block\n'
brew test "$formula_ref"
