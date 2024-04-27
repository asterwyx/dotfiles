# 个人配置
<!-- <a id="top"></a> -->
[English](README.md) | 中文

## Themes

<div align="center">
  <img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/hyprdots_banner.png">

<br><br>

  <img style="margin: 0 5px 10px 0; width: 48%;" src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_1.png" />
  <img style="margin: 0 0 10px 5px; width: 48%;" src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_2.png" />
  <img style="margin: 0 5px 10px 0; width: 48%;" src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_3.png" />
  <img style="margin: 0 0 10px 5px; width: 48%;" src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_4.png" />
</div>

<div align="right">
  <br>
  <a href="#top"><kbd> <br> 🡅 <br> </kbd></a>
</div>

**在 Archlinux 上可以拥有与本人一致的体验**

## Desktop Environment（Native Wayland）

**在 Archlinux 上安装包（需要 aur）:**

1. shell

```bash
yay -S eza fish rsync bat starship htop
```

2. fonts

```
yay -S ttf-firacode-nerd ttf-maple-sc-nerd
```

3. utils

```bash
yay -S qt5-wayland qt6-wayland
```

4. hypr

```bash
yay -S dunst libbotify hyprland rofi-lbonn-wayland waybar swww swaylock-effects-git wlogout grimblast-git cliphist pipewire-pulse swappy hyde-cli-git
```

5. dependency

```bash
yay -S polkit-gnome xdg-desktop-portal-hyprland python-pyamdgpuinfo parallel imagemagick qt5-imageformats brightnessctl pavucontrol pamixer pacman-contrib
```

6. theme

```bash
yay -S nwg-look kvantum qt5ct qt6ct
```

7. apps

```bash
yay -S google-chrome kitty fastfetch neovim fcitx5
```

8. others

```bash
pip install hyprshade
```

## 初始化

1. 安装上面所有的包。
2. 运行`./init.sh`脚本，它会初始化环境变量并且释放资源。
3. 如果在运行过程中发现在家目录有冲突文件，请手动删除它，然后运行：`./config.sh install`。

## 运行

在 tty 中执行`startde w`。

## 更新

```bash
./config.sh uninstall
git pull --rebase
./config.sh install
```

## 卸载

非常简单的删除初始化过程中创建的符号，只需要运行：`./config.sh uninstall`。

## 编辑器 (Neovim)

### 开发环境 (Neovim 配置依赖)

安装包：

```bash
yay -S python fnm
```

```bash
python -m venv ~/.python_venv
```

```bash
fnm install <version/--latest> --node-dist-mirror=https://npmmirror.com/mirrors/node
fnm default <version>
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup sh
```

重启终端以应用的环境变量，使用`./stow.sh`脚本会自动使用国内源：

```bash
./stow.sh
```

```bash
pip install pynvim
```

```bash
npm i -g neovim
```

`pip`和`npm`只是 neovim 基本的环境配置，强烈建议跑完 lua 的配置后使用`:checkhealth`命令查看哪些命令未安装，可继续使用相应的包管理进行安装！

### 安装 neovim 配置

默认使用 ssh 协议，如果使用 http 协议，需要修改`.gitmodules`文件，设置`url`为:

```
https://github.com/groveer/nvchad-starter.git
```

更新 git 子模块:

```bash
git submodule update --init
```

<div align="right">
  <br>
  <a href="#top"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Thanks to

1. [hyprdots](https://github.com/prasanthrangan/hyprdots)：主题来源于这里！
