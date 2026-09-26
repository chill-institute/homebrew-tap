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

[Verify](./.github/workflows/verify.yml) runs the audit on pull requests and the
install smoke on pushes to `main` that change `Formula/`, on dispatch, and weekly.
The weekly run catches release assets that disappear after the formula lands.
