# Contributing

This repository contains Homebrew release plumbing. Keep formula and install
changes aligned with the tagged CLI release they describe.

## Verify

```bash
./scripts/verify.sh
CHILL_TAP_INSTALL_SMOKE=1 ./scripts/verify.sh
```

The second command installs the formula and runs its test block. Verification
disables Homebrew auto-update; set `HOMEBREW_NO_AUTO_UPDATE=0` to update first.
