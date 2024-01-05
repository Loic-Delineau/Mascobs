#!/bin/bash
# DESCRIPTION ======================================================================
# This scripts installs all the necessary packages for an installation of Mascobs
# running on : 	WSL


# FUNCTIONS ======================================================================
# Wait for user confirmation (y) to continue or (n) to quit
prompt() {
	
	echo "Continue by entering 'y', stop the script by pressing 'n'"

	# Failsafe for wrong value inputted
	fail="1"

	while [[ "$fail" == "1" ]]; do
		
		# Read 1 input char
		echo -n "> "
		read -n 1 -r cmd < /dev/tty

		# Keyboard input checking
		if [[ "$cmd" == "y" ]]; then
			fail="0"
			echo ""
		elif [[ "$cmd" == "n" ]]; then
			echo ""
			exit
		else
			echo -e "\nUnknown key..."
		fi
done
}

# USER RECAP ======================================================================
# Summary of all the packages that will be installed
echo "Here are all the packages that will be installed"
echo ""
echo "| Package Name | Package Size (Mb) | Package Purpose   |"
echo "| ---------------------------------------------------- |"
echo "| texlive      | 500Mb             | All Tex ecosystem |"
echo "| wslu         |   5Mb             | Open pdf from WSL |"
echo "|              |    Mb             |                   |" 
echo "|                                                      |" 
echo "|       TOTAL:   505Mb                                 |" 
echo "| ---------------------------------------------------- |"
echo ""
prompt


# INSTALLATION ======================================================================
# Installing texlive to compile and view latex documents
sudo apt install texlive -y

# Installing wslu to launch default pdf viewer from the wsl shell
sudo apt install wslu -y      # wslview file.pdf

#	wslview file.pdf seems to trigger bitdefender as you are launching a .exe from inside wsl
# 	either open it differently or just maybe copy the pdf to the desktop of the user?

# Checking path to user's Desktop
ls /mnt/c/Users > windows_users.txt
sed -i '/^All.*/d' windows_users.txt
sed -i '/^Default.*/d' windows_users.txt
sed -i '/^Public.*/d' windows_users.txt
sed -i '/^desktop.ini.*/d' windows_users.txt


echo ""
echo ""
echo "The program now expects your Windows User name to be:"

# Works only if there is 1 user on the windows machine
cat windows_users.txt

path="/mnt/c/Users/"
path="$path`cat windows_users.txt`"
path="$path/Desktop"

echo ""
echo "The program will therefore save all the .pdfs it generates in:"
echo "$path"
rm windows_users.txt

echo "As a proof of concept, the program just generate a file called:"
echo "lol.txt"
echo "and saved it on yours Windows desktop, go make sure it's there!"
echo ""
cd $path
touch lol.txt
echo "Great! The program knows where your desktop is, happy LaTeXing!!" > lol.txt



