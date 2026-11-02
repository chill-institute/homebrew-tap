# Homebrew Tap

`homebrew-tap` publishes Homebrew formulas for `chill.institute` packages.

## Scope

- Treat this repo as release plumbing, not product code.
- `chill-cli` generates `Formula/chilly.rb` from its published `checksums.txt`
  with `scripts/homebrew-formula` and commits it through the GitHub API. Change
  the formula shape there, not here.
- Run `./scripts/verify.sh`; add `CHILL_TAP_INSTALL_SMOKE=1` for install proof.
- CI: [verify.yml](./.github/workflows/verify.yml).

## Read More

- [Install](./README.md)
- [Formula verification](./CONTRIBUTING.md)
