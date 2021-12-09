if [ "$1" == "-help" ]; then
	echo "Usage: bash remove-shortcut.sh shortcut-name"
	echo "Replace shortcut-name with the name of the shortcut (without extension)."
else
	if test -f "$HOME/.local/$1.desktop"; then
		echo "Found file in $HOME/.local!"
		rm "$HOME/.local/$1.desktop"
		echo "Success!"
	else
		echo "File not found in ~/.local!"
	fi
	
	if test -f "/usr/share/applications/$1.desktop"; then
		echo "Found file in /usr/share/applications"
		rm "/usr/share/applications/$1.desktop"
		echo "Success!"
	else
		echo "File not found in /usr/share/applications"
	fi
fi
