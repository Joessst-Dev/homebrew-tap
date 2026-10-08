# homebrew-tap

A [Homebrew](https://brew.sh) tap for command-line tools by Joessst-Dev. The casks work on
macOS and Linux.

| App | What it is |
|-----|------------|
| [`fft`](https://github.com/Joessst-Dev/fft-cli) | A CLI for the fulfillmenttools API — every operation reachable from your shell |
| [`faehigkeiten`](https://github.com/Joessst-Dev/faehigkeiten) | A terminal UI and CLI that installs and tracks agent skills (`SKILL.md`) for Claude Code, Codex, Copilot, Cursor and more |

## fft

```sh
brew install Joessst-Dev/tap/fft
```

Then `fft version`. Upgrades are `brew upgrade fft`.

## faehigkeiten

```sh
brew install Joessst-Dev/tap/faehigkeiten
```

This installs `faehigkeiten` and the short alias `fgk`, plus bash, zsh and fish
completions. Run `fgk` to start the TUI, or `fgk --help` for the CLI. Upgrades are
`brew upgrade faehigkeiten`.

## This tap is generated

Each cask in `Casks/` is written by [GoReleaser](https://goreleaser.com) on every tag of
its project:

| Cask | Written by |
|------|------------|
| `Casks/fft.rb` | [`Joessst-Dev/fft-cli`](https://github.com/Joessst-Dev/fft-cli) |
| `Casks/faehigkeiten.rb` | [`Joessst-Dev/faehigkeiten`](https://github.com/Joessst-Dev/faehigkeiten) |

Do not edit them by hand: the next release silently reverts the edit. Issues and pull
requests belong on the app's repository, not here.
