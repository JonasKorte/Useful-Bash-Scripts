if test -f "~/.local/$1"; then
	echo "Found file in ~/.local!"
	rm "~/.local/$1"
fi
if test -f "/usr/share/applications/$1"; then
	echo "Found file in ~/.local!"
	rm "/usr/share/applications/$1"
fi
