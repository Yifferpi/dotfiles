#! /bin/bash

OS="unknown"
# figure out OS
if [ -f /etc/os-release ]; then
    source /etc/os-release
    OS=$NAME
fi


if [ "$OS" = "Arch Linux" ]; then
    sudo pacman -S --needed docker docker-compose
else
    echo "OS unknown"
    exit 1
fi

sudo systemctl start docker
sudo systemctl enable docker


## Update the package manager's package list
#sudo pacman -Sy
#
## Install Docker
#sudo pacman -S docker
#
## Start the Docker daemon
#sudo systemctl start docker
#
## Enable the Docker daemon to start on boot
#sudo systemctl enable docker