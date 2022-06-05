#!/usr/bin/env bash

if [[ ! $(which brew) ]] ; then
    echo "Brew is not installed on this system, see https://brew.sh for installation guide"
    exit 1
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install --cask eset-cyber-security-pro
brew install --cask jetbrains-toolbox
brew install --cask logitech-camera-settings
brew install --cask logitech-g-hub
brew install --cask meetingbar
brew install --cask microsoft-outlook
brew install --cask microsoft-teams
brew install --cask rescuetime
brew install --cask slack

# Remove outdated versions from the cellar
brew cleanup
