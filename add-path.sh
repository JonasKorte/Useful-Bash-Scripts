if [ "$1" == "-help" ] ; then
	echo "Usage: bash add-path.sh <path>"
else
	echo "if [ -d "$1" ] ; then" >> ~/.profile
	echo "    PATH="$1:$PATH"" >> ~/.profile
	echo "fi" >> ~/.profile
	echo "Success!"
	echo "Please log out and log back in to make changes permanent!"
fi
