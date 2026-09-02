#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
for f in .github/workflows/*.yml; do
  grep -q '^permissions:' "$f" || { echo "$f: no workflow-level permissions" >&2; fail=1; }
  if grep -qE '^\s+schedule:' "$f"; then
    echo "$f: declares a GitHub schedule (accepted here: owner decision, commit 1740f85)" >&2
  fi
  grep -E '^\s+uses: [^./]' "$f" | grep -vE '@[0-9a-f]{40}( #.*)?$' && { echo "$f: unpinned action" >&2; fail=1; }
  c=$(grep -c 'actions/checkout@' "$f" || true); p=$(grep -c 'persist-credentials: false' "$f" || true)
  [ "$c" = "$p" ] || { echo "$f: checkout without persist-credentials: false" >&2; fail=1; }
done
exit $fail
