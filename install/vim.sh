#! /bin/bash

# Change to config directory
cd "../vim" || exit 1
config_path=$(pwd)

cd "/home/$USER" || exit 1

install_config() {
    ln -s "$config_path/vimrc" .vimrc
    ln -s "$config_path/vim" .vim
    mkdir -p .vim/{backup,swap,undo} #creating dirs required by vimrc
}

if [ -h ".vimrc" -a -h ".vim" ]; then
    # symlinks exist
    install_config
    echo "Replaced old symlink in in $PWD for .vimrc"
    echo "Replaced old symlink in in $PWD for .vim"
elif [ -f ".vimrc" -o -d ".vim" ]; then
    # physical config exists
    echo "vim config exists, skipping"
    exit
else
    # no config found
    install_config
    echo "Installed $PWD/.vimrc"
    echo "Installed $PWD/.vim"
fi
echo "Don't forget to run ':PlugInstall' inside vim!"