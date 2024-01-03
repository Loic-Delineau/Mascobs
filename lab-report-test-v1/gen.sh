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


