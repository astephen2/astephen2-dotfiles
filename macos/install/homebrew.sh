#!/usr/bin/env bash

source $HOME/.dotfiles/bootstrap/lib/helpers.sh

#####
# install homebrew
#####

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    running "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        error "unable to install homebrew, script $0 abort!"
        exit -1
    fi
fi
ok

running "checking brew-cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
    running "installing brew-cask"
    require_brew caskroom/cask/brew-cask
fi
ok

for file in $DOTFILES/macos/brew/*
do
  filename=$(basename "$file")
  filename="${filename%.*}"
  if ask "install $filename"; then
    brew tap Homebrew/bundle
    brew bundle --file=$file
  fi
done