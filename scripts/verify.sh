#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
formula_path="$repo_root/Formula/chilly.rb"
tap_name="${CHILL_TAP_VERIFY_TAP:-chill-institute/harness-verify-local}"
formula_ref="$tap_name/chilly"
temp_repo=''

installed_by_script=0

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

printf '==> checking formula style\n'
brew style "$formula_path"

temp_repo="$(mktemp -d)"
mkdir -p "$temp_repo/Formula"
cp "$formula_path" "$temp_repo/Formula/chilly.rb"
git -C "$temp_repo" init -q
git -C "$temp_repo" add Formula/chilly.rb
git -C "$temp_repo" -c user.name='Harness' -c user.email='harness@chill.institute' commit -qm 'tap snapshot'

brew untap "$tap_name" >/dev/null 2>&1 || true

printf '==> tapping %s from a temporary repo snapshot\n' "$tap_name"
brew tap "$tap_name" "$temp_repo" >/dev/null

printf '==> auditing formula\n'
brew audit --strict "$formula_ref"

if [[ "${CHILL_TAP_INSTALL_SMOKE:-0}" != "1" ]]; then
  printf '==> skipping install smoke; set CHILL_TAP_INSTALL_SMOKE=1 to exercise the formula test block\n'
  exit 0
fi

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
