#!/usr/bin/env bash

echo "###########################"
echo "Setting up this Macbook ..."
echo "###########################"

echo "> Tell me your full name:"
read fullname

echo "> Tell me your email:"
read email

echo "> Checking if exists software updates"
#sudo softwareupdate -i -a

echo "> Installing command-line-tools"
#xcode-select --install

# Set computer?!

echo "> Setting up git user"
git config --global user.name $fullname
git config --global user.email $email

# Private keys?!

echo "> Install Homebrew"
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewing
echo "> Brewing apps"
#sh brew.sh

# Cask
echo "> Installing casks"
#sh cask.sh

# Set node
echo "> Installing node 9 and setting as default"
nvm install 9
nvm alias default 9

# NPM global cli's
echo "> Installing npm global cli's"
#sh npm.sh

# Customize iterm

# Restart computer
echo "###########################"
echo " Finished your Setup!!"
echo " Restart your computer now!"
echo "###########################"
