#!/bin/bash

# Updating and Upgrading
brew update
brew upgrade

# Installing productivity steroids
brew install git
brew install the_silver_searcher
brew install tree
brew install zsh

# Quicklook plugins
brew install qlcolorcode 
brew install qlmarkdown

# Taps
brew tap homebrew/services
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

# Cleanup
brew cleanup
