#!/usr/bin/env bash

echo "###########################"
echo "Setting up this Macbook ..."
echo "###########################"

echo
echo "> Tell me your full name:"
read fullname

echo
echo "> Tell me your email:"
read email

echo
echo "> Checking if exists software updates"
#sudo softwareupdate -i -a

echo
echo "> Installing command-line-tools"
#xcode-select --install

# Set computer?!

echo
echo "> Setting up git user"
#git config --global user.name $fullname
#git config --global user.email $email

# Private keys?!

echo
echo "> Install Homebrew"
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewing
echo
echo "> Brewing apps"
#sh brew.sh

# Cask
echo
echo "> Installing casks"
#sh cask.sh

# Mac App Store app's
echo
echo "> Installing Mac App Store app's with mas"
#sh mas.sh

# Set node
echo
echo "> Installing node 9 and setting as default"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
nvm install 9
nvm alias default 9

# NPM global cli's
echo
echo "> Installing npm global cli's"
sh npm.sh

# Customize iterm

# Restart computer
echo
echo "###########################"
echo " Finished your Setup!!"
echo " Restart your computer now!"
echo "###########################"
