#!/bin/sh

# directories
mkdir devspace
mkdir -p pictures/screenshots

# enable rpmfusion
sudo dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# zsh
sudo dnf -y install zsh

# x11
sudo dnf -y install libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXi-devel libX11-xcb libXext-devel

# kernel
sudo dnf -y install kernel-devel kernel-headers

# necessary tools
sudo dnf -y install doas gcc xdg-utils xclip git xrandr xset imlib2-devel NetworkManager-tui tlp tlp-rdw \
	pulseaudio-utils ripgrep brightnessctl valgrind freerdp flameshot setxkbmap \
	openvpn dbus-devel libconfig-devel libdrm-devel libev-devel libxcb-devel mesa-libGL-devel \
	meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel lzop readline-devel cmake

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rust-src
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# nodejs
sudo dnf -y install nodejs

# development tools
sudo dnf -y install vim neovim ccls golang-x-tools-gopls
sudo npm install --global pyright

# omnisharp
# curl -L https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.16/omnisharp-linux-x64.zip > ~/omnisharp.zip
# unzip ~/omnisharp.zip -d ~/.omnisharp
# chmod +x ~/.omnisharp/run
# rm ~/omnisharp.zip

# compositor
git clone https://github.com/ibhagwan/picom
cd picom && \
	git submodule update --init --recursive && \
	meson --buildtype=release . build && \
	ninja -C build && \
	sudo ninja -C build install && \
	cd ..
rm -rf picom

# snapd
sudo dnf -y install snapd
sudo ln -s /var/lib/snapd/snap /snap

# browser
sudo dnf -y install qutebrowser qt5-qtwebengine-freeworld

# spotify
sudo snap install spotify && snap install --classic

# other
sudo dnf -y install htop gdouros-symbola-fonts fzf tmux leafpad
cargo install viu
cargo install tree-sitter-cli
