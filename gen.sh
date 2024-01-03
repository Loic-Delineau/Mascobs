#!/bin/bash

# Clean up build directory
rm -rf ./latex
mkdir ./latex

# Generate latex in ./latex directory
pdflatex --output-directory=./latex ./file.tex

# Copy .pdf on windows desktop
cp ./latex/file.pdf /mnt/c/Users/ldeli/Desktop
echo ""
echo "Warning, this saved it on ldeli's desktop"


