#! /bin/bash

# Update package list
pacman -Sy

# Install packages
pacman -S --needed alsa alsa-utils pipewire pipewire-pulse wireplumber

# Enable sockets
systemctl --user enable pipewire pipewire-pulse wireplumber

# use 'wpctl' to manage audio settings