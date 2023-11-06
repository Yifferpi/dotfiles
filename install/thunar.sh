#! /bin/bash

sudo pacman -S -needed thunar
# required for Thunar to display thumbnails
sudo pacman -S --needed tumbler
# required for Thunar to access Samba Shares
sudo pacman -S --needed gvfs-smb

#yay -Ss thunar-nextcloud-plugin