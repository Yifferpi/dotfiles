#! /bin/sh

# required for some apps to store secrets (e.g. Nextcloud Client)
sudo pacman -S --needed gnome-keyring libsecret

systemctl --user start gnome-keyring-daemon.service
systemctl --user enable gnome-keyring-daemon.service