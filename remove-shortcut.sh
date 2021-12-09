if test -f "~/.local/$1"; then
	echo "Found file in ~/.local!"
	rm "~/.local/$1"
	echo "Success!"
else
	echo "File not found in ~/.local!"
fi
if test -f "/usr/share/applications/$1"; then
	echo "Found file in /usr/share/applications"
	rm "/usr/share/applications/$1"
	echo "Success!"
else
	echo "File not found in /usr/share/applications"
fi
