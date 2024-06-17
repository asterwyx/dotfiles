# Personal Configurations
<!-- <a id="top"></a> -->
English | [中文](README.zh.md)

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

**You can have the same user experience as me in Archlinux**

## Desktop Environment（Native Wayland）

**Install packages in Archlinux (need aur):**

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
yay -S dunst libbotify hyprland rofi-lbonn-wayland-git waybar swww swaylock-effects-git wlogout grimblast-git cliphist pipewire-pulse swappy hyde-cli-git wf-recorder
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

## Init

1. Install all packages
2. Run `./init.sh`, it will initialize env and patch sources.
3. If there is a conflicting file, delete it manually. run `./config.sh install`

## Run

run `startde w` in tty.

## Update

```bash
./config.sh uninstall
git pull --rebase
./config.sh install
```

## Uninstall

It is easy to rm the symbol, just run `./config.sh uninstall`

## Editor/IDE (Neovim)

### Developer Environment (Neovim config dependeies)

Install packages:

```bash
yay -S python fnm
```

```bash
python -m venv ~/.python_venv
```

```bash
fnm install <version/--latest>
fnm default <version>
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Restart terminal for apply environment.

```bash
pip install pynvim
```

```bash
npm i -g neovim
```

`pip` and `npm` are just the basic environment configuration of neovim, it is highly recommended to use the `:checkhealth` command to see which commands are not installed after running the configuration of lua, you can continue to use the corresponding package management for installation!

### install neovim config

default use git ssh, if you use http, modify `.gitmodules`, set `url`:

```
https://github.com/groveer/nvchad-starter.git
```

Update git submodule:

```bash
git submodule update --init
```

<div align="right">
  <br>
  <a href="#top"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Thanks to

1. [hyprdots](https://github.com/prasanthrangan/hyprdots): themes from here!
