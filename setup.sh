#!/bin/sh

# zsh
dnf -y install zsh

# x11
dnf -y install libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXi-devel

# text editors
dnf -y install vim leafpad

# necessary tools
dnf -y install xrandr xcompmgr xset xcompmgr imlib2-devel NetworkManager-tui tlp tlp-rdw pulseaudio-utils ripgrep brightnessctl valgrind freerdp flameshot feh setxkbmap openvpn

# snapd
dnf install snapd
ln -s /var/lib/snapd/snap /snap

# browser, spotify, and k8s client
snap install chromium && snap install spotify && snap install kontena-lens --classic

# rust
dnf install rust cargo

# other
dnf -y install htop gdouros-symbola-fonts readline-devel fzf tmux simplescreenrecorder
cargo install viu

# file manager
git clone https://github.com/jarun/nnn
cd nnn && make O_NERD=1 && cp ./nnn /bin/ && ./plugins/getplugs && cd ..
