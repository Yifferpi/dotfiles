#! /bin/bash

# Update package list
pacman -Sy

# Install packages
pacman -S --needed bluez bluez-utils

# bluez: bluetooth stack
# bluez-utils: utilities like bluetoothctl

systemctl start bluetooth.service
systemctl enable bluetooth.service