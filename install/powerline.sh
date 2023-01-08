#! /bin/bash

#if [ $(whoami) != "root" ]; then
#    echo "Are you root?"
#    exit 1
#fi

#installing powerline
#sudo apt install -y powerline powerline-gitstatus
sudo pacman --noconfirm -S --needed powerline

#adding config

path=$(dirname $(readlink -f $0))
cd /home/$USER/.config
if [ -d "powerline" ]; then
    echo "$PWD/powerline exists, skipping"
else
    echo "Linking powerline config.."
    ln -s $path/powerline powerline

    echo "Installing fonts to /usr/share/fonts"
    sudo cp -r $path/powerline_fonts /usr/share/fonts
    echo "Don't forget to change the terminal font!"
fi
