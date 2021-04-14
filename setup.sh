#!/bin/sh

# fish
sudo dnf -y install fish
curl -L https://get.oh-my.fish | fish
omf install eden

# x headers
sudo dnf -y install libX11-devel libXft-devel

# file manager
git clone https://github.com/ranger/ranger .ranger
cd .ranger && sudo make install && cd ..

# vim
sudo dnf -y install vim

# docker
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo dnf install moby-engine docker-compose
sudo systemctl enable docker
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# wm environment
sudo dnf -y install rofi feh fontawesome-fonts

# other tools
sudo dnf -y install htop tlp-rdw
