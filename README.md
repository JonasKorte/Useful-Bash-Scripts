# Useful-Bash-Scripts
A growing collection of useful bash scripts to make your life using Linux a lot easier! 
<br/>
<br/>
## Installation
#### 1.
Clone/Download this repository.

#### 2.
If you downloaded the ZIP file, extract it. (For the example it is cloned into the user's home folder).

#### 3.
Open the terminal, and navigate (cd) into the extracted directory. (/home/user/Useful-Bash-Scripts)

#### 4.
Run the following command (Replace "/home/user/Useful-Bash-Scripts" with where you extracted/cloned the repository):
```
bash add-path.sh /home/user/Useful-Bash-Scripts
```

#### 5.
Log out, then log back in.

#### 6.
Done!
<br/>
<br/>
You can check if the directory is added to path by running the following command:
```
echo $PATH
```

## General Usage
```
bash script.sh arg1 arg2 ...
```
Replace "script.sh" with the name of the script you want to use (with extension).
Replace the arguments (arg1, arg2, ...) with the arguments for the script. Every script has different arguments.
<br/>
<br/>
If you need to know the specific usage of a script, look it up in the README.md file or run:
```
bash script.sh -help
```
Again, replace "script.sh" with the name of the script you want to use (with extension).

## Contributing
### New Script Ideas
If you got an idea for another useful script you want me to implement, you can write an issue on this GitHub repository with "Script Request: " as the title, followed by a short description of what the script should do. You can expand more on what it does and how it should operate in the issue description.
<br/>
<br/>
If you know how to write Bash scripts, feel free to make a pull request containing the new script. I will test it and approve the pull request if it works properly.

### Bug Report
If one of the scripts is not working for you because of a bug, please create an issue on this GitHub repository with "Script Bug: " as the title, followed by a short description of what went wrong. You can further describe this problem in the issue description.
<br/>
<br/>
If you know how to write Bash scripts, feel free to make a pull request containing fixed script. I will test it and approve the pull request if it works properly.

### Script Changes
If a script lacks a feature, please create an issue on this GitHub repository with "Script Change: " as the title, followed by a short description of what you want different. You can further describe this problem in the issue description.
<br/>
<br/>
If (once again) you know how to write Bash scripts, feel free to make a pull request containing your version of the script. I will test it and approve the pull request if it works properly.

## Script Documentation
Here you can find the descriptions and usages for every script in the collection.
<br/>
<br/>
### Add Shortcut
Creates a .desktop file for an executable/script and moves/copies the .desktop file to "/usr/share/applications" to make it searchable.

#### Usage
```
bash add-shortcut.sh executable-file desktop-file-name application-name icon-file
```

Replace "executable-file" with the file you want to run (with extension and without the path).
Replace "desktop-file-name" with the name of the .desktop file (without extension and without the path).
Replace "application-name" with the name of the application. This will be how you search for the application.
Replace "icon-file" with the icon file (with extension and without the path).
<br/>
<br/>
Note: If you want to move the .desktop file (and not keep a copy in the directory of the executable file), add "-m" at the end of the command.
<br/>
<br/>
Example Copy (Godot Engine):
```
bash add-shortcut.sh godot.linuxbsd.tools.64 godotengine  "Godot Engine" icon.png
```
<br/>
<br/>
Example Move (Godot Engine):
```
bash add-shortcut.sh godot.linuxbsd.tools.64 godotengine  "Godot Engine" icon.png -m
```

### Add Path
Adds a directory to PATH permanently. This means that if you want to open/run files from this directory you don't have to specify the path and name of the directory every time (this one is for you u/rexvansexron). 

#### Usage
```
bash add-path.sh path
```

Replace "path" with the full path of the directory you want to add.
<br/>
<br/>
Note: After you run this command, please log out, then log back in for the changes to work.
<br/>
<br/>
You can check if the directory is added by running the following command after you log back in:
```
echo $PATH
```
The directory should now be in that list.
<br/>
<br/>
Example (Useful-Bash-Scripts):
```
bash add-shortcut.sh /home/jonas/Useful-Bash-Scripts
```
