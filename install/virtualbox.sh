#! /bin/bash

# Update package list
pacman -Sy

# Install packages
sudo pacman -S --needed virtualbox virtualbox-host-modules-arch
# Note: install virtualbox-host-dkms for linux lts kernel or other kernel

# load kernel module to avoid having to reboot
sudo modprobe vboxdrv

# add user to group to allow passing external USB devices
sudo usermod -aG vboxusers "$USER"

sudo pacman -S -needed virtualbox-guest-iso
