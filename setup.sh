#!/bin/sh

# zsh
dnf -y install zsh

# x11
dnf -y install libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXi-devel libX11-xcb libXext-devel

# necessary tools
dnf -y install gcc git xrandr xset imlib2-devel NetworkManager-tui tlp tlp-rdw \
	pulseaudio-utils ripgrep brightnessctl valgrind freerdp flameshot feh setxkbmap \
	openvpn dbus-devel libconfig-devel libdrm-devel libev-devel libxcb-devel mesa-libGL-devel \
	meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel

# development tools
dnf -y install ccls vim golang-x-tools-gopls

# compositor
git clone https://github.com/ibhagwan/picom
cd picom && \
	git submodule update --init --recursive && \
	meson --buildtype=release . build && \
	ninja -C build && \
	ninja -C build install && \
	cd ~

# snapd
dnf install snapd
ln -s /var/lib/snapd/snap /snap

# browser, spotify, and k8s client
snap install chromium && snap install spotify && snap install kontena-lens --classic

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rust-src
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# other
dnf -y install htop gdouros-symbola-fonts readline-devel fzf tmux simplescreenrecorder leafpad
cargo install viu

# file manager
git clone https://github.com/jarun/nnn
cd nnn && make O_NERD=1 && cp ./nnn /bin/ && ./plugins/getplugs && cd ..
