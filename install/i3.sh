#! /bin/bash

case $1 in
    h*|-h* )    cat << EOF
Usage:
    This skript installs symlinks to all the config files in this directory. 
    If a config already exists, the symlink for that config is skipped.
EOF
                exit;;
    *)          ;;
esac

# location of the configs git repo
cd ../i3
path=$(dirname $(readlink -f $0))

# Installing configs that belong in .config directory
cd /home/$USER/.config


function install_folder() {
	# $1 should hold filename to be installed
	echo ""
    echo "Installing $1"
	if [ -L "$1" ]; then
		 echo "symlink for .$1 exists, replacing.."
		 rm "$1"
		    ln -s $path/$1 "$1"
	elif [ -d "$1" ]; then
	    echo "$PWD/$1 exists"
	    	while true
	    	do 
			echo "How do you want to handle $1?"
	    	        read -p "o for overwriting, s for skipping, b for backing up old config: " answer
	    	        case "$answer" in 
	    	    	    [oO]* ) rm -rf "$1"
	    			    ln -s "$path/$1" "$1"
				    echo "Replaced previous $1"
	    	    		    break;;
	    	    	    [sS]* ) echo "Skipping $1"
	    	    		    break;;
	    	    	    [bB]* ) mv "$1" "$1.bak"
	    			    ln -s "$path/$1" "$1"
				    echo "Old $1 perserved as $1.bak"
	    	    		    break;;
	    	    		* ) echo "not a valid choice"
	    	        esac
	    	done
	else
		echo "$1 does not exit yet, creating symlink."
	    ln -s "$path/$1" "$1"
	    echo "Installed $PWD/$1"
	fi
}
# Install dependencies
sudo pacman -S --needed i3-wm i3status 
# launcher and notification server
sudo pacman -S --needed rofi dunst

# transparent background, needs support from terminal
sudo pacman -S --needed nitrogen picom

# i3 config
install_folder "i3"
install_folder "i3status"

