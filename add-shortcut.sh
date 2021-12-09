if [ "$1" == "-help" ];
	then
		echo "Usage: bash add-shortcut <executable-file> <desktop-file-name> <application-name> <icon-file>"
		echo "Add -m to move desktop file to applications folder, add nothing to copy instead."
		echo "<executable-file> has to include extension, but should not include the path."
		echo "<desktop-file-name> should neither include the extension, nor the path."
		echo "<application-name> represents the name of the application you actually search for."
		echo "<icon-file> has to include extension, but should not include the path."
else
		touch "$2.desktop"
		echo "[Desktop Entry]" > "$2.desktop"
		echo "Encoding=UTF-8" >> "$2.desktop"
		echo "Version=1.0" >> "$2.desktop"
		echo "Type=Application" >> "$2.desktop"
		echo "Terminal=false" >> "$2.desktop"
		echo "Exec=$PWD/$1" >> "$2.desktop"
		echo "Name=$3" >> "$2.desktop"
		echo "Icon=$PWD/$4" >> "$2.desktop"

		if [ "$5" == "-m" ];
			then 
				sudo cp "$2.desktop" /usr/share/applications
				sudo cp "$2.desktop" ~/.local
				sudo rm "$2.desktop"
		else
				sudo cp "$2.desktop" /usr/share/applications
		fi
 
		echo "Successfully Created Desktop File!"
fi
