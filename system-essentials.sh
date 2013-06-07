#!/usr/bin/env bash

if [ `uname` = 'Linux' ]
then
  apt-get -y update
  # INSTALL NECCESSARY DEVELOPMENT TOOLS ON UBUNTU (UNIX)
  apt-get -y install build-essential zlib1g-dev libssl-dev libreadline5-dev libyaml-dev
fi

# ruby
cd /tmp
curl -O ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz
tar -xvzf ruby-2.0.0-p195.tar.gz
cd ruby-2.0.0-p195/
./configure --prefix=/usr/local
make
make install

# chef-solo
sudo ln -s -f ~/bin/dotfiles/chef/ /var/chef
gem install chef --no-ri --no-rdoc

if [ ! `which brew` ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi
brew update
brew doctor

# Textmate2 install
# 
# gitk --all & # - very handy to use and monitor the branch and commits changes

# Install GCC + Git
# mkdir ~/tmp
# cd ~/tmp
# curl https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg > GCC-10.7-v2.pkg
# sudo installer -pkg GCC-10.7-v2.pkg -target /

# chef
# https://github.com/pivotal-sprout/sprout
# https://github.com/opscode-cookbooks/dmg
