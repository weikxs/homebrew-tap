# weikxs/homebrew-tap

**English** | [简体中文](README.zh-CN.md)

[Homebrew](https://brew.sh) packages for the tools published by [weikxs](https://github.com/weikxs), for macOS
(Apple silicon and Intel) and Linux (x86_64 and arm64).

## Tools

| Tool | What it is | Latest | Platforms | Install |
|---|---|---|---|---|
| [GitPersona](https://github.com/weikxs/gitpersona) | Git profiles that follow your directories: commits, pushes, `gh` and `glab` use the account that belongs to the folder you are in | [![release](https://img.shields.io/github/v/release/weikxs/gitpersona?label=)](https://github.com/weikxs/gitpersona/releases/latest) | macOS, Linux | `brew install weikxs/tap/gitpersona` |
| [OTPKeep](https://github.com/weikxs/otpkeep) | A private two-factor authenticator (TOTP, HOTP, Steam) for the menu bar: codes a click or a shortcut away, accounts kept on your own devices | [![release](https://img.shields.io/github/v/release/weikxs/otpkeep?label=)](https://github.com/weikxs/otpkeep/releases/latest) | macOS | `brew install --cask weikxs/tap/otpkeep` |

## Install

Install a tool directly; Homebrew adds this tap by itself:

```sh
brew install weikxs/tap/gitpersona
```

Or add the tap once, then install by name:

```sh
brew tap weikxs/tap
brew install gitpersona
```

Homebrew picks the right build for your machine (Apple silicon or Intel Mac, Linux x86_64 or arm64). OTPKeep is an
app: Homebrew installs it on macOS (one universal app for Apple silicon and Intel); on Linux, use its install script.

## GitPersona

**Install and check it:**

```sh
brew install weikxs/tap/gitpersona
gitpersona version
```

**Set it up:** sign in to each GitHub account once with `gh auth login`, then run `gitpersona setup --web`. See the
[GitPersona README](https://github.com/weikxs/gitpersona#readme) for everything else.

**Upgrade:**

```sh
brew update && brew upgrade gitpersona
```

**Uninstall:** first let GitPersona remove its block from your Git configuration and put back the `includeIf` rules it
took over, then remove the package:

```sh
gitpersona uninstall
brew uninstall gitpersona
```

Your profiles stay in `~/.config/gitpersona`; delete that folder too if you do not want them any more.

**About the macOS binary:** it is not signed by Apple yet. The package removes the quarantine flag after installing,
so macOS does not show "gitpersona is damaged and cannot be opened". Details are in GitPersona's
[SECURITY.md](https://github.com/weikxs/gitpersona/blob/main/SECURITY.md).

**Without Homebrew:** `curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh | sh`
installs the same release on macOS and Linux.

## OTPKeep

**Install it:**

```sh
brew install --cask weikxs/tap/otpkeep
```

Then open OTPKeep from Launchpad or `/Applications`: it lives in the menu bar. See the
[OTPKeep README](https://github.com/weikxs/otpkeep#readme) for everything else.

**Upgrade:**

```sh
brew update && brew upgrade --cask otpkeep
```

**Uninstall:** quit OTPKeep (menu bar icon → Quit), then:

```sh
brew uninstall --cask otpkeep
```

Your accounts are never removed: they stay in `~/Library/Application Support/OTPKeep`. Export an encrypted backup
first if you might need them, then delete that folder if you do not want them any more.

**About the macOS app:** it is not signed by Apple yet. The package removes the quarantine flag after installing,
so macOS does not refuse to open it the first time. Details are in OTPKeep's
[SECURITY.md](https://github.com/weikxs/otpkeep/blob/main/SECURITY.md).

**Without Homebrew:** `curl -fsSL https://raw.githubusercontent.com/weikxs/otpkeep/main/install.sh | sh` installs
the same release on macOS and Linux (`.deb`, `.rpm` or AppImage).

## Troubleshooting

| Problem | Fix |
|---|---|
| `Error: Unexpected method 'postflight_steps'` | Your Homebrew is older than the package format: `brew update`, then install again |
| `brew upgrade` says it is already up to date right after a release | Refresh the tap: `brew update` |
| macOS says "gitpersona is damaged and cannot be opened" | Reinstall with `brew reinstall gitpersona`; or remove the flag yourself: `xattr -d com.apple.quarantine "$(command -v gitpersona)"` |
| macOS says "OTPKeep cannot be opened" or that it is damaged | Reinstall with `brew reinstall --cask otpkeep`; or remove the flag yourself: `xattr -dr com.apple.quarantine /Applications/OTPKeep.app` |
| `gitpersona` is not found after installing | Make sure Homebrew's `bin` is on your `PATH` (`brew doctor` says how) |
| Another `gitpersona` runs instead | An older copy comes first on `PATH`: `which -a gitpersona`, then remove the old one |

## How this tap is maintained

- Each package is a [cask](https://docs.brew.sh/Cask-Cookbook) written by the tool's release automation when a
  version is released ([GoReleaser](https://goreleaser.com) for GitPersona, OTPKeep's release workflow for
  OTPKeep); do not edit `Casks/*.rb` by hand.
- Every package points at the archives or disk images of the tool's GitHub release and checks them by SHA-256.
- Each tool publishes with its own deploy key, which can write only to this repository.

## Problems and feedback

Open an issue in the tool's own repository, such as
[weikxs/gitpersona](https://github.com/weikxs/gitpersona/issues) or [weikxs/otpkeep](https://github.com/weikxs/otpkeep/issues).

## License

[MIT](LICENSE)
