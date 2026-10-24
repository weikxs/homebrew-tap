# weikxs/homebrew-tap

[English](README.md) | **简体中文**

[weikxs](https://github.com/weikxs) 发布的各个工具的 [Homebrew](https://brew.sh) 软件包，支持 macOS（Apple 芯片和 Intel）
和 Linux（x86_64 和 arm64）。

## 工具

| 工具 | 简介 | 最新版本 | 平台 | 安装 |
|---|---|---|---|---|
| [GitPersona](https://github.com/weikxs/gitpersona) | 跟着目录自动切换的 Git 身份：提交、推送、`gh` 和 `glab` 自动使用当前目录对应的账户 | [![release](https://img.shields.io/github/v/release/weikxs/gitpersona?label=)](https://github.com/weikxs/gitpersona/releases/latest) | macOS、Linux | `brew install weikxs/tap/gitpersona` |

## 安装

直接安装工具即可，Homebrew 会自动添加这个 tap：

```sh
brew install weikxs/tap/gitpersona
```

或者先添加一次 tap，以后按名字安装：

```sh
brew tap weikxs/tap
brew install gitpersona
```

Homebrew 会自动选择适合你机器的版本（Apple 芯片或 Intel 的 Mac，x86_64 或 arm64 的 Linux）。

## GitPersona

**安装并确认：**

```sh
brew install weikxs/tap/gitpersona
gitpersona version
```

**开始配置：** 先用 `gh auth login` 把每个 GitHub 账户登录一次，然后运行 `gitpersona setup --web`。
其他用法见 [GitPersona 的 README](https://github.com/weikxs/gitpersona/blob/main/README.zh-CN.md)。

**升级：**

```sh
brew update && brew upgrade gitpersona
```

**卸载：** 先让 GitPersona 从 Git 配置中删除它的区块，并恢复它接管过的 `includeIf` 规则，再删除软件包：

```sh
gitpersona uninstall
brew uninstall gitpersona
```

你的配置文件保留在 `~/.config/gitpersona`；不再需要的话，把这个目录也删掉。

**关于 macOS 版程序：** 暂未经过 Apple 签名。软件包安装后会自动去掉隔离标记，所以 macOS 不会提示
“gitpersona 已损坏，无法打开”。详见 GitPersona 的 [SECURITY.md](https://github.com/weikxs/gitpersona/blob/main/SECURITY.md)。

**不用 Homebrew：** 运行 `curl -fsSL https://raw.githubusercontent.com/weikxs/gitpersona/main/install.sh | sh`，
在 macOS 和 Linux 上安装同一个版本。

## 故障排查

| 问题 | 处理方法 |
|---|---|
| `Error: Unexpected method 'postflight_steps'` | 你的 Homebrew 版本太旧：先运行 `brew update`，再重新安装 |
| 新版本刚发布，`brew upgrade` 却提示已是最新 | 刷新 tap：`brew update` |
| macOS 提示“gitpersona 已损坏，无法打开” | 用 `brew reinstall gitpersona` 重装；或者手动去掉隔离标记：`xattr -d com.apple.quarantine "$(command -v gitpersona)"` |
| 安装后找不到 `gitpersona` 命令 | 确认 Homebrew 的 `bin` 目录在 `PATH` 中（`brew doctor` 会告诉你怎么设置） |
| 运行的是别处的旧版 `gitpersona` | `PATH` 中有旧版本排在前面：用 `which -a gitpersona` 找到它，然后删除旧的 |

## 这个 tap 如何维护

- 每个软件包都是一个 [Cask](https://docs.brew.sh/Cask-Cookbook)，在工具发布新版本时由发布流程（[GoReleaser](https://goreleaser.com)）
  自动写入；请不要手动修改 `Casks/*.rb`。
- 每个软件包都指向该工具 GitHub Release 中的压缩包，并用 SHA-256 校验。
- 每个工具用自己的部署密钥发布，该密钥只能写入这个仓库。

## 问题反馈

请在对应工具自己的仓库里提 issue，例如 [weikxs/gitpersona](https://github.com/weikxs/gitpersona/issues)。

## 许可证

[MIT](LICENSE)
