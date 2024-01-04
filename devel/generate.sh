#!/bin/bash

# Clean up build directory
rm -rf ./build
mkdir ./build

# Generate latex in ./latex directory
pdflatex --output-directory=./build ./file.tex

# Copy .pdf on windows desktop
cp ./build/file.pdf /mnt/c/Users/ldeli/Desktop
echo ""
echo "Warning, this saved it on ldeli's desktop"

# Open pdf in default pdf viewer
echo ""
echo "Now also opening .pdf with default pdf viewer"
echo ""
wslview ./build/file.pdf
# If this crashes wsl, add an exception to you antivirus to this executable
# c:\windows\system32\wsl.exe


