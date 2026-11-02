# Contributing

This repository contains Homebrew release plumbing. Keep formula and install
changes aligned with the tagged CLI release they describe.

## Verify

```bash
./scripts/verify.sh
CHILL_TAP_INSTALL_SMOKE=1 ./scripts/verify.sh
```

Both commands download every platform's archive and check its sha256. The
second also installs the formula and runs its test block. Verification
disables Homebrew auto-update; set `HOMEBREW_NO_AUTO_UPDATE=0` to update first.

[verify.sh](./scripts/verify.sh) owns the checks and options;
[verify.yml](./.github/workflows/verify.yml) owns triggers and CI mode. The
periodic check catches release assets that disappear after publication.
