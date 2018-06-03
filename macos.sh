#!/bin/bash


###################################################################
# Finder
###################################################################

# Disable all animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true


###################################################################
# Keyboard, Trackpad, Peripherals
###################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# KeyRepeat and InitialKeyRepeat speed
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 10


###################################################################
# Restart affected applications 
###################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done
