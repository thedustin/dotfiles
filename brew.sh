#!/usr/bin/env bash

if [[ ! $(which brew) ]] ; then
    echo "Brew is not installed on this system, see https://brew.sh for installation guide"
    exit 1
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install diffutils

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`
brew install gnu-sed

brew install make
brew install gnu-tar
brew install gnu-time
brew install grep
brew install ripgrep
brew install gawk
brew install safe-rm

# Updated shells
# Note: don’t forget to add `/usr/local/bin/<EACHSHELL>` to `/etc/shells` before running `chsh`.
brew install bash
brew install zsh
brew install fish

brew install bash-completion@2

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
#brew install homebrew/dupes/nano
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# run script when a file changes (see http://entrproject.org/)
brew install entr

brew install git git-gui
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx
brew install graphviz

brew install terminal-notifier

# thanks paul, now my "guys"

brew install php
brew install composer
brew install phpunit

composer g require psy/psysh:@stable

brew install curl
brew install httpie
brew install telnet
brew install wget

brew install go
brew install rust
brew install cmake
brew install automake
brew install lua
brew install python
brew install ruby

brew install watch

brew install docker
brew install docker-machine
brew install helm
brew install minikube
brew install kubectx

# “Ted what is my one rule? New is always better!”
brew install htop          # new top
brew install tldr          # new man

brew install bat           # new cat
brew install prettyping    # new ping
brew install diff-so-fancy # new diff

brew install micro
brew install vim
brew install nano
brew install openssh

brew install z
brew install jq

brew install --cask discord
brew install --cask docker
brew install --cask enpass
brew install --cask imageoptim
brew install --cask pastebot
brew install --cask postman
brew install --cask signal
brew install --cask spotify
brew install --cask threema
brew install --cask typora
brew install --cask visual-studio-code

# Install my favorite monospace font
brew install homebrew/cask-fonts/font-hasklig

# Remove outdated versions from the cellar
brew cleanup
