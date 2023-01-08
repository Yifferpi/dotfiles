#! /bin/bash

# change to bash config directory
cd ../bash || { echo "folder ../bash not found"; exit 1; }

cd "/home/$USER" || { echo "home directory not found"; exit 1; }

path=$(dirname "$(readlink -f "$0")")
install_file() {
	# $1 should hold filename to be installed
	echo ""
	if [ -L ".$1" ]; then
		 echo "symlink for .$1 exists, replacing.."
		 rm ".$1"
		    ln -s "$path"/"$1" ".$1"
	elif [ -f ".$1" ]; then
	    echo "$PWD/.$1 exists"
	    	while true
	    	do 
				echo "How do you want to handle .$1?"
				echo -n "o for overwriting, s for skipping, b for backing up old config: "
	    	    read -r answer
	    	    case "$answer" in 
	    	    	[oO]* ) rm ".$1"
		    				ln -s "$path"/"$1" ".$1"
				    		echo "Replaced previous $1"
	    	    		    break;;
	    	    	[sS]* ) echo "Skipping $1"
	    	    		    break;;
	    	    	[bB]* ) mv ".$1" ".$1.bak"
		    				ln -s "$path"/"$1" ".$1"
				    		echo "Old $1 perserved as .$1.bak"
	    	    		    break;;
	    	    	* ) echo "not a valid choice"
	    	    esac
	    	done
	else
		echo ".$1 does not exit yet, creating symlink."
		ln -s "$path"/"$1" ".$1"
	    echo "Installed $PWD/.$1"
	fi
}

install_file "bashrc"
install_file "bash_aliases"
