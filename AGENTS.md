# Homebrew Tap

`homebrew-tap` publishes Homebrew formulas for `chill.institute` packages.

## Scope

- Treat this repo as release plumbing, not product code.
- Keep formulas aligned with tagged releases from their source repos.
- `chill-cli` generates `Formula/chilly.rb` from its published `checksums.txt`
  with `scripts/homebrew-formula` and commits it through the GitHub API. Change
  the formula shape there, not here.
- Update formulas and install guidance together when release behavior changes.
- Run `./scripts/verify.sh`; add `CHILL_TAP_INSTALL_SMOKE=1` for install proof.

## Read More

- [Install](./README.md)
- [Formula verification](./CONTRIBUTING.md)
