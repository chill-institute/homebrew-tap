# Contributing

Thanks for contributing to `chill-institute/homebrew-tap`.

## Scope

- Keep this repo focused on Homebrew formulas and tap maintenance.
- Update formulas and install guidance together when release behavior changes.
- Prefer small, reviewable changes.

## Validation

- Run `./scripts/verify.sh` before opening a pull request.
- Set `CHILL_TAP_INSTALL_SMOKE=1` when you want the verification pass to install the formula and run its `test do` block on a clean machine or in CI.
