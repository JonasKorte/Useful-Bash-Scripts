#!/bin/bash
#Collecting infos via zenity
PROGRAM="xdg-open "
TERMINAL=false
if ! NAME="$(zenity --entry --text "Name of the Application" --title "Name")"; then
  exit;
fi
echo $NAME
echo "file name ok"
if ! EXEC=$(zenity --file-selection --title="Choose the file"); then
    exit;
fi
echo "exec ok"
if ! ICON=$(zenity --file-selection --title="Choose the Icon")
	 then
		if [[ $ICON=="" ]]
			then
	 		echo "No icon selected, chosing default icon (only works on GNOME so far)" #TODO: Figure out a better way for this
			MIME=$(xdg-mime query filetype "$EXEC")
			echo $MIME
				case "$MIME" in
					audio/*) ICON=/usr/share/icons/Adwaita/scalable/mimetypes/audio-x-generic-symbolic.svg
					;;
					application/*) ICON=/usr/share/icons/Adwaita/scalable/mimetypes/application-x-executable-symbolic.svg
					;;
					image/*) ICON=/usr/share/icons/Adwaita/scalable/mimetypes/image-x-generic-symbolic.svg
					;;
					video/*) ICON=/usr/share/icons/Adwaita/scalable/mimetypes/video-x-generic-symbolic.svg
					;;
				esac
			
		fi
fi
###################################################################Figure out, whether it is a shell script and if yes execute it accordingly!#######################################################
				if [[ "$EXEC" =~ ".sh" ]]; then 
					SLASHNUMBER=$(echo $EXEC  | grep -ho '/' | wc -w)
					((SLASHNUMBER++))
					PFADSLASH=""   #variablen initialisierung
    					PROGRAM="" && echo "found exec sh"
					APPNAME=./$(echo $EXEC | cut -d/ -f$(($SLASHNUMBER)))
					echo $APPNAME
					i=0
					((SLASHNUMBER--))
					while [ $i -lt $SLASHNUMBER ]
						 do   
							((i++))
							PFADSLASH=$PFADSLASH$i,
							echo $PFADSLASH
						 done
					PFADSLASH=$(echo $PFADSLASH | sed 's/,$//')
					echo $PFADSLASH
					PFAD=$(echo $EXEC | cut -d/ -f$PFADSLASH);
					echo $PFAD
					EXEC=$PFAD/$APPNAME			
					TERMINAL=true
					ICON=/usr/share/icons/Adwaita/scalable/mimetypes/application-x-executable-symbolic.svg
				fi
###############################################################End of the shellscript section, why didn't I use xterm instead of all this, would ve been easier...#######################################	
#create desktop file and fill it up, open the software with MIME-TYPE
echo "creating .desktop file"
touch ~/.local/share/applications/"$NAME".desktop 
echo "file created"
echo "[Desktop Entry]"                  >> ~/.local/share/applications/"$NAME".desktop 
echo "Name="$NAME""               	>> ~/.local/share/applications/"$NAME".desktop 
echo "Exec=$PROGRAM${EXEC// /\\ }"      >> ~/.local/share/applications/"$NAME".desktop 
echo "Icon=${ICON// /\\ }"              >> ~/.local/share/applications/"$NAME".desktop 
echo "Terminal=$TERMINAL"               >> ~/.local/share/applications/"$NAME".desktop 
echo "Type=Application"                 >> ~/.local/share/applications/"$NAME".desktop 
echo "file creation done"

#set the executable bit
chmod +x $HOME/.local/share/applications/"$NAME".desktop
echo "file created"

zenity --info --text "File created!"

exit 1

