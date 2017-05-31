#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion@2
brew install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install homebrew/dupes/nano
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# run script when a file changes (see http://entrproject.org/)
brew install entr

# Install other useful binaries
brew install the_silver_searcher
brew install fzf

brew install git
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install rename
brew install tree
brew install zopfli
#brew install ffmpeg --with-libvpx

brew install terminal-notifier

# thanks paul, now my "guys"

brew tap homebrew/php

brew install automake

brew install php71
brew install composer
brew install phpunit

brew install micro

# Remove outdated versions from the cellar
brew cleanup
