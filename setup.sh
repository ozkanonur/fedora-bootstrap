#!/bin/sh

# browsers
dnf -y install chromium

# x11
dnf -y install libX11-devel libXft-devel libXinerama-devel

# file manager
git clone https://github.com/ranger/ranger $HOME/.ranger
cd .ranger && sudo make install && cd ..

# text editors
dnf -y install vim leafpad

# tools
dnf -y install brightnessctl rofi xrandr feh htop tlp

# docker
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
firewall-cmd --permanent --zone=trusted --add-interface=docker0
firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
dnf -y install moby-engine docker-compose
systemctl enable docker
groupadd docker
gpasswd -a $USER docker
systemctl restart docker
