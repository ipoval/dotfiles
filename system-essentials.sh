#!/usr/bin/env bash

if [ `uname` = 'Linux' ]
then
  apt-get -y update
  # INSTALL NECCESSARY DEVELOPMENT TOOLS ON UBUNTU (UNIX)
  apt-get -y install build-essential zlib1g-dev libssl-dev libreadline5-dev libyaml-dev
fi

# -- Install MacOS XCode
# https://itunes.apple.com/us/app/xcode/id497799835?mt=12&uo=4
# -- Install Command Line Tools
# -- Install iOS 6 Simulator
# XCode > Preferences > Downloads

if [ ! `which brew` ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi
brew update
brew doctor

# ruby via rvm
\curl -L https://get.rvm.io | bash -s stable --rails
source /Users/ipoval/.rvm/scripts/rvm

# CHEF-SOLO
# sudo ln -s -f ~/bin/dotfiles/chef/ /var/chef
# sudo gem install chef --no-ri --no-rdoc -v '11.6.0'
  # Run chef-solo
  # chef-solo -c solo.rb -j node.json
