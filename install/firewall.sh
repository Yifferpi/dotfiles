#! /bin/bash

# Update package list
pacman -Sy

# Install package
pacman -S ufw

# Disable to avoid conflict, ufw will manage iptables
systemctl disable iptables.service
systemctl disable ip6tables.service

# Start and enable ufw
systemctl enable ufw.service
systemctl start ufw.service