# weikxs/homebrew-tap

[English](README.md) | **简体中文**

[weikxs](https://github.com/weikxs) 发布的各个工具的 [Homebrew](https://brew.sh) 软件包和一键安装脚本，支持 macOS
（Apple 芯片和 Intel）和 Linux（x86_64 和 arm64）。

## 工具

| 工具 | 简介 | 最新版本 | 平台 |
|---|---|---|---|
| [GitPersona](https://github.com/weikxs/gitpersona) | 跟着目录自动切换的 Git 身份：提交、推送、`gh` 和 `glab` 自动使用当前目录对应的账户 | [![release](https://img.shields.io/github/v/release/weikxs/gitpersona?label=)](https://github.com/weikxs/gitpersona/releases/latest) | macOS、Linux |
| [OTPKeep](https://github.com/weikxs/otpkeep) | 常驻菜单栏、注重隐私的两步验证器（TOTP、HOTP、Steam）：点一下或按一个快捷键就有验证码，账号只留在你自己的设备上 | [![release](https://img.shields.io/github/v/release/weikxs/otpkeep?label=)](https://github.com/weikxs/otpkeep/releases/latest) | macOS、Linux |

## 安装

两种方式，装的是同一个发布版本：Homebrew，或者全自动的安装脚本。

| | Homebrew | 安装脚本 |
|---|---|---|
| **GitPersona**（macOS、Linux） | `brew install weikxs/tap/gitpersona` | `curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh \| sh` |
| **OTPKeep**（macOS；Linux 用脚本） | `brew install --cask weikxs/tap/otpkeep` | `curl -fsSL https://raw.githubusercontent.com/weikxs/otpkeep/main/install.sh \| sh` |

### 用 Homebrew 安装

```sh
brew install weikxs/tap/gitpersona          # GitPersona，macOS 和 Linux
brew install --cask weikxs/tap/otpkeep      # OTPKeep，macOS
```

Homebrew 会自动添加这个 tap，并按你的机器选对版本（Apple 芯片或 Intel 的 Mac，x86_64 或 arm64 的 Linux）。也可以先添加一次
tap，再按名字安装：`brew tap weikxs/tap`，然后 `brew install gitpersona` 或 `brew install --cask otpkeep`。OTPKeep
是桌面应用，Homebrew 只在 macOS 上安装它；Linux 请用它的安装脚本。

### 用安装脚本安装

```sh
curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh | sh    # GitPersona
curl -fsSL https://raw.githubusercontent.com/weikxs/otpkeep/main/install.sh | sh       # OTPKeep
```

脚本会按你的系统和芯片选对版本，从该工具最新的 GitHub 发布页下载，先用发布页的 `checksums.txt` 核对（对不上就什么都不装），再安装，
不改动其他任何东西。以后再运行同一行命令就是升级。

| 工具 | 脚本安装什么 |
|---|---|
| GitPersona | 把 `gitpersona` 程序放进 `~/.local/bin`（root 用户放进 `/usr/local/bin`），并在 shell 配置里加一行带标记的 `PATH` 设置 |
| OTPKeep，macOS | 把 `OTPKeep.app` 放进 `/Applications`（没有权限时放进 `~/Applications`），打开时不会再弹"来自互联网"的拦截 |
| OTPKeep，Debian / Ubuntu / 树莓派系统 | `.deb`，用 `apt` 安装（会要求 `sudo`） |
| OTPKeep，Fedora / RHEL / openSUSE（x86_64） | `.rpm`，用 `dnf`、`zypper` 或 `yum` 安装（会要求 `sudo`） |
| OTPKeep，其他 Linux | AppImage，装成 `~/.local/bin/otpkeep-app`，并加入应用菜单 |

选项写在 `sh -s --` 后面，例如 `curl -fsSL …/install.sh | sh -s -- --version v0.1.0`：

| 选项 | GitPersona | OTPKeep |
|---|---|---|
| `--version <标签>` | 安装指定版本，而不是最新版 | 同左 |
| `--dir <目录>` | 程序放在哪里 | macOS：`OTPKeep.app` 放在哪里；AppImage：`otpkeep-app` 放在哪里 |
| `--no-modify-path` | 不把目录加入 shell 的 `PATH` | 同左（AppImage） |
| `--format deb\|rpm\|appimage` | — | Linux：指定安装包格式 |

### 装好之后

- **GitPersona：** 用 `gitpersona version` 确认，先用 `gh auth login` 把每个 GitHub 账户都登录一次，再运行
  `gitpersona setup --web`。详见 [GitPersona 的 README](https://github.com/weikxs/gitpersona/blob/main/README.zh-CN.md)。
- **OTPKeep：** macOS 上从启动台或"应用程序"打开（常驻在菜单栏）；Linux 上从应用菜单打开，或运行 `otpkeep-app`（常驻在系统托盘），
  然后添加第一个账号。详见 [OTPKeep 的 README](https://github.com/weikxs/otpkeep/blob/main/README.zh-CN.md)。

## 升级

| 工具 | 用 Homebrew 安装的 | 用脚本安装的 |
|---|---|---|
| GitPersona | `brew update && brew upgrade gitpersona` | 再运行一次安装脚本 |
| OTPKeep | `brew update && brew upgrade --cask otpkeep` | 先退出 OTPKeep，再运行一次安装脚本 |

## 卸载

| 工具 | 用 Homebrew 安装的 | 用脚本安装的 | 保留的内容 |
|---|---|---|---|
| GitPersona | 先 `gitpersona uninstall`，再 `brew uninstall gitpersona` | 先 `gitpersona uninstall`，再删除 `~/.local/bin/gitpersona`，以及 shell 配置文件里标着 `# Added by the GitPersona installer` 的那一行 | 你的配置在 `~/.config/gitpersona` |
| OTPKeep | 先退出 OTPKeep，再 `brew uninstall --cask otpkeep` | 先退出 OTPKeep，然后：macOS 把 `OTPKeep.app` 移到废纸篓；`.deb` 用 `sudo apt remove otp-keep`；`.rpm` 用 `sudo dnf remove otp-keep`；AppImage 删除 `~/.local/bin/otpkeep-app` 和 `~/.local/share/applications/otpkeep.desktop` | 你的账号在 `~/Library/Application Support/OTPKeep`（macOS）或 `~/.local/share/otpkeep`（Linux） |

`gitpersona uninstall` 会先从 Git 配置里删掉 GitPersona 写入的那一段，并恢复它接管过的 `includeIf` 规则。OTPKeep 的账号任何时候
都不会被自动删除：如果以后可能还要用，请先导出加密备份；确定不要了，再删除那个目录。

## macOS 版暂未签名

两个工具目前都还没有苹果签名。Homebrew 和安装脚本会在安装后去掉隔离标记，所以第一次运行时 macOS 不会拒绝。如果你手动下载文件，
请先用 `checksums.txt` 核对，并在"系统设置 → 隐私与安全性"里允许一次。详见
[GitPersona 的 SECURITY.md](https://github.com/weikxs/gitpersona/blob/main/SECURITY.md) ·
[OTPKeep 的 SECURITY.md](https://github.com/weikxs/otpkeep/blob/main/SECURITY.md)。

## 故障排查

| 问题 | 处理方法 |
|---|---|
| `Error: Unexpected method 'postflight_steps'` | 你的 Homebrew 版本太旧：先运行 `brew update`，再重新安装 |
| 新版本刚发布，`brew upgrade` 却提示已是最新 | 刷新 tap：`brew update` |
| macOS 提示"gitpersona 已损坏，无法打开" | `brew reinstall gitpersona`，或自己去掉标记：`xattr -d com.apple.quarantine "$(command -v gitpersona)"` |
| macOS 提示"无法打开 OTPKeep"或"已损坏" | `brew reinstall --cask otpkeep`，或自己去掉标记：`xattr -dr com.apple.quarantine /Applications/OTPKeep.app` |
| 安装后找不到 `gitpersona` 命令 | 用 Homebrew 装的：确认 Homebrew 的 `bin` 目录在 `PATH` 中（`brew doctor` 会告诉你怎么设置）。用脚本装的：打开一个新终端，或运行脚本打印的那行 `export PATH=…` |
| 运行的是另一个旧的 `gitpersona` | 旧版本在 `PATH` 中排在前面：用 `which -a gitpersona` 找到后删掉旧的 |
| 安装脚本提示 "checksum mismatch" | 下载的文件损坏或被篡改，脚本什么都没装：重新运行一次 |
| OTPKeep 的 AppImage 打不开 | 安装 FUSE 2（`libfuse2` 或 `fuse2`），或用 `otpkeep-app --appimage-extract-and-run` 启动 |
| OTPKeep 脚本提示需要基于 glibc 的发行版 | Alpine 等 musl 系统暂不支持 |

## 这个 tap 如何维护

- 每个软件包都是一个 [Cask](https://docs.brew.sh/Cask-Cookbook)，在工具发布新版本时由它的发布流程自动写入
  （GitPersona 用 [GoReleaser](https://goreleaser.com)，OTPKeep 用自己的发布流程）；请不要手动修改 `Casks/*.rb`。
- 每个软件包都指向该工具 GitHub Release 中的压缩包或磁盘镜像，并用 SHA-256 校验；安装脚本用发布页的 `checksums.txt`
  核对同样的文件。
- 每个工具用自己的部署密钥发布，该密钥只能写入这个仓库。

## 问题反馈

请在对应工具自己的仓库里提 issue：[weikxs/gitpersona](https://github.com/weikxs/gitpersona/issues) 或
[weikxs/otpkeep](https://github.com/weikxs/otpkeep/issues)。

## 许可证

[MIT](LICENSE)
