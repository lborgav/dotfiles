#!/bin/bash

echo "Setting up this Macbook ..."

echo "> Install Homebrew"
# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewing
sh brew.sh
