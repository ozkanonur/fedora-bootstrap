#!/bin/sh

# zsh
dnf -y install zsh

# x11
dnf -y install libX11-devel libXft-devel libXinerama-devel

# text editors
dnf -y install vim leafpad

# necessary tools
dnf -y install xrandr tlp tlp-rdw brightnessctl freerdp flameshot feh setxkbmap openvpn

# snapd
dnf install snapd
ln -s /var/lib/snapd/snap /snap

# browser, spotify, mail client
snap install chromium && snap install spotify
dnf -y install sylpheed

# rust
dnf install rust cargo

# other
dnf -y install htop gdouros-symbola-fonts readline-devel fzf tmux simplescreenrecorder
cargo install viu

# file manager
git clone https://github.com/jarun/nnn
cd nnn && make O_NERD=1 && cp ./nnn /bin/ && ./plugins/getplugs && cd ..

# docker
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
firewall-cmd --permanent --zone=trusted --add-interface=docker0
firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
dnf -y install moby-engine docker-compose
systemctl enable docker
groupadd docker
gpasswd -a $USER docker
systemctl enable docker
