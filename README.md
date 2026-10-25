# weikxs/homebrew-tap

**English** | [简体中文](README.zh-CN.md)

[Homebrew](https://brew.sh) packages and one-line install scripts for the tools published by
[weikxs](https://github.com/weikxs), for macOS (Apple silicon and Intel) and Linux (x86_64 and arm64).

## Tools

| Tool | What it is | Latest | Platforms |
|---|---|---|---|
| [GitPersona](https://github.com/weikxs/gitpersona) | Git profiles that follow your directories: commits, pushes, `gh` and `glab` use the account that belongs to the folder you are in | [![release](https://img.shields.io/github/v/release/weikxs/gitpersona?label=)](https://github.com/weikxs/gitpersona/releases/latest) | macOS, Linux |
| [OTPKeep](https://github.com/weikxs/otpkeep) | A private two-factor authenticator (TOTP, HOTP, Steam) for the menu bar: codes a click or a shortcut away, accounts kept on your own devices | [![release](https://img.shields.io/github/v/release/weikxs/otpkeep?label=)](https://github.com/weikxs/otpkeep/releases/latest) | macOS, Linux |

## Install

Two ways, the same release either way: Homebrew, or a fully automatic install script.

| | Homebrew | Install script |
|---|---|---|
| **GitPersona** (macOS, Linux) | `brew install weikxs/tap/gitpersona` | `curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh \| sh` |
| **OTPKeep** (macOS; Linux by script) | `brew install --cask weikxs/tap/otpkeep` | `curl -fsSL https://raw.githubusercontent.com/weikxs/otpkeep/main/install.sh \| sh` |

### With Homebrew

```sh
brew install weikxs/tap/gitpersona          # GitPersona, macOS and Linux
brew install --cask weikxs/tap/otpkeep      # OTPKeep, macOS
```

Homebrew adds this tap by itself and picks the right build for your machine (Apple silicon or Intel Mac, Linux
x86_64 or arm64). You can also add the tap once and install by name: `brew tap weikxs/tap`, then
`brew install gitpersona` or `brew install --cask otpkeep`. OTPKeep is a desktop app, so Homebrew installs it on
macOS only; on Linux, use its install script.

### With the install script

```sh
curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh | sh    # GitPersona
curl -fsSL https://raw.githubusercontent.com/weikxs/otpkeep/main/install.sh | sh       # OTPKeep
```

Each script picks the build for your system and CPU, downloads it from the tool's latest GitHub release, checks it
against the release's `checksums.txt` (and installs nothing if it does not match), then installs it. Nothing else is
changed. Run the same line again to upgrade.

| Tool | What the script installs |
|---|---|
| GitPersona | the `gitpersona` binary into `~/.local/bin` (`/usr/local/bin` as root), and one marked line adding it to your shell's `PATH` |
| OTPKeep, macOS | `OTPKeep.app` into `/Applications` (or `~/Applications`), without the "downloaded from the internet" prompt |
| OTPKeep, Debian / Ubuntu / Raspberry Pi OS | the `.deb`, with `apt` (asks for `sudo`) |
| OTPKeep, Fedora / RHEL / openSUSE (x86_64) | the `.rpm`, with `dnf`, `zypper` or `yum` (asks for `sudo`) |
| OTPKeep, any other Linux | the AppImage, as `otpkeep-app` in `~/.local/bin`, with an applications-menu entry |

Options go after `sh -s --`, for example `curl -fsSL …/install.sh | sh -s -- --version v0.1.0`:

| Option | GitPersona | OTPKeep |
|---|---|---|
| `--version <tag>` | install this release instead of the latest | same |
| `--dir <folder>` | where the binary goes | macOS: where `OTPKeep.app` goes; AppImage: where `otpkeep-app` goes |
| `--no-modify-path` | do not add the folder to your shell's `PATH` | same (AppImage) |
| `--format deb\|rpm\|appimage` | — | Linux: choose the package format |

### After installing

- **GitPersona:** check it with `gitpersona version`, sign in to each GitHub account once with `gh auth login`, then
  run `gitpersona setup --web`. See the [GitPersona README](https://github.com/weikxs/gitpersona#readme).
- **OTPKeep:** open it from Launchpad or `/Applications` on macOS (it lives in the menu bar), or from the
  applications menu or with `otpkeep-app` on Linux (it lives in the system tray), and add your first account. See
  the [OTPKeep README](https://github.com/weikxs/otpkeep#readme).

## Upgrade

| Tool | Installed with Homebrew | Installed with the script |
|---|---|---|
| GitPersona | `brew update && brew upgrade gitpersona` | run the install script again |
| OTPKeep | `brew update && brew upgrade --cask otpkeep` | quit OTPKeep, then run the install script again |

## Uninstall

| Tool | Installed with Homebrew | Installed with the script | What stays |
|---|---|---|---|
| GitPersona | `gitpersona uninstall`, then `brew uninstall gitpersona` | `gitpersona uninstall`, then delete `~/.local/bin/gitpersona` and the line marked `# Added by the GitPersona installer` in your shell's startup file | your profiles in `~/.config/gitpersona` |
| OTPKeep | quit OTPKeep, then `brew uninstall --cask otpkeep` | quit OTPKeep, then: macOS — move `OTPKeep.app` to the Trash; `.deb` — `sudo apt remove otp-keep`; `.rpm` — `sudo dnf remove otp-keep`; AppImage — delete `~/.local/bin/otpkeep-app` and `~/.local/share/applications/otpkeep.desktop` | your accounts in `~/Library/Application Support/OTPKeep` (macOS) or `~/.local/share/otpkeep` (Linux) |

`gitpersona uninstall` first removes GitPersona's block from your Git configuration and puts back the `includeIf`
rules it took over. Nothing ever deletes OTPKeep's accounts: export an encrypted backup first if you might need them,
then delete that folder if you do not want them any more.

## macOS builds are not signed yet

Neither tool is signed by Apple yet. Homebrew and the install scripts remove the quarantine flag after installing,
so macOS does not refuse to run them the first time. If you download a file by hand, check it against
`checksums.txt` and allow it once in System Settings → Privacy & Security. Details:
[GitPersona's SECURITY.md](https://github.com/weikxs/gitpersona/blob/main/SECURITY.md) ·
[OTPKeep's SECURITY.md](https://github.com/weikxs/otpkeep/blob/main/SECURITY.md).

## Troubleshooting

| Problem | Fix |
|---|---|
| `Error: Unexpected method 'postflight_steps'` | Your Homebrew is older than the package format: `brew update`, then install again |
| `brew upgrade` says it is already up to date right after a release | Refresh the tap: `brew update` |
| macOS says "gitpersona is damaged and cannot be opened" | `brew reinstall gitpersona`, or remove the flag yourself: `xattr -d com.apple.quarantine "$(command -v gitpersona)"` |
| macOS says "OTPKeep cannot be opened" or that it is damaged | `brew reinstall --cask otpkeep`, or remove the flag yourself: `xattr -dr com.apple.quarantine /Applications/OTPKeep.app` |
| `gitpersona` is not found after installing | With Homebrew: make sure Homebrew's `bin` is on your `PATH` (`brew doctor` says how). With the script: open a new terminal, or run the `export PATH=…` line it printed |
| Another `gitpersona` runs instead | An older copy comes first on `PATH`: `which -a gitpersona`, then remove the old one |
| The install script stops with "checksum mismatch" | The download was damaged or tampered with, and nothing was installed: run it again |
| The OTPKeep AppImage does not start | Install FUSE 2 (`libfuse2` or `fuse2`), or start it with `otpkeep-app --appimage-extract-and-run` |
| The OTPKeep script says it needs a glibc-based distribution | Alpine and other musl systems are not supported yet |

## How this tap is maintained

- Each package is a [cask](https://docs.brew.sh/Cask-Cookbook) written by the tool's release automation when a
  version is released ([GoReleaser](https://goreleaser.com) for GitPersona, OTPKeep's release workflow for
  OTPKeep); do not edit `Casks/*.rb` by hand.
- Every package points at the archives or disk images of the tool's GitHub release and checks them by SHA-256; the
  install scripts check the same files against the release's `checksums.txt`.
- Each tool publishes with its own deploy key, which can write only to this repository.

## Problems and feedback

Open an issue in the tool's own repository: [weikxs/gitpersona](https://github.com/weikxs/gitpersona/issues) or
[weikxs/otpkeep](https://github.com/weikxs/otpkeep/issues).

## License

[MIT](LICENSE)
