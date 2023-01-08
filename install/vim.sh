#! /bin/bash
cd ..
path=$(dirname $(readlink -f $0))

cd /home/$USER

if [ -f ".vimrc" -o -d ".vim" ]; then
    echo "vim config exists, skipping"
else
    ln -s $path/vimrc .vimrc
    ln -s $path/vim .vim
    mkdir .vim/{backup,swap,undo} #creating dirs required by vimrc
    echo "Installed $PWD/.vimrc"
    echo "Installed $PWD/.vim"
fi
echo "Don't forget to run ':PlugInstall' inside vim!"