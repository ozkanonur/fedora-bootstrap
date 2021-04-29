#!/bin/sh

# zsh
dnf -y install zsh

# x11
dnf -y install libX11-devel libXft-devel libXinerama-devel

# file manager
git clone https://github.com/ranger/ranger
cd ranger && make install && cd ..

# text editors
dnf -y install vim leafpad

# necessary tools
dnf -y install xrandr tlp tlp-rdw brightnessctl flameshot feh

# snapd
dnf install snapd
ln -s /var/lib/snapd/snap /snap

# browser, spotify, mail client
snap install chromium && snap install spotify
dnf -y install sylpheed

# other
dnf -y install htop

# docker
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
firewall-cmd --permanent --zone=trusted --add-interface=docker0
firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
dnf -y install moby-engine docker-compose
systemctl enable docker
groupadd docker
gpasswd -a $USER docker
systemctl enable docker
