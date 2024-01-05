#!/bin/bash

# ====================================================================================
# Abstract:	This script encodes the Latex Document in Base 64 and returns 
#		a URL for overleaf called by xdg-open to open in default browser
# 
# Author:	Loïc Delineau
# Date: 	04/01/2023
# Licence: 	GNU GPLv3
# ====================================================================================

# (1) --------------------------------------------------------------------------------
# First, we check that the total base64 encoding is under 8000 characters
# if its not, Nginx will refuse to parse the url

nb_char=`base64 file.tex | wc -c`

if [[ ${nb_char} > 8000 ]];
then
	echo "Your file is too big to be encoded into the url :("
	echo "Your file encodes in ${nb_char} BASE64 characters but the max Nginx will parse is 8000"
	exit
fi

# (2) --------------------------------------------------------------------------------
# Second, we start building the url
url="https://www.overleaf.com/docs?snip_uri=data:application/x-tex;base64,"

# We temporarily store it there
touch temp_encode.txt
echo -n "$url" > temp_encode.txt

# We encode our latex document, use awk to nemove all newline, 
# use sed to remove all white space and then preprend it to our temporary file
base64 file.tex | awk '{a=a s $0;s=" "}END{print a}' | sed 's/ *//g' >> temp_encode.txt

# We output file to standard output and pipe it into xargs who passes it 
# as an argument to xdg-open who itself opens it with the default browser
cat temp_encode.txt | xargs xdg-open

# We remove temporary file for clean script
rm temp_encode.txt
