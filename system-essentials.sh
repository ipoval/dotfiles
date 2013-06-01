#!/usr/bin/env bash

if [ ! `which brew` ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# if [ `uname` = 'Linux' ]
# then
#   apt-get -y update
#   # INSTALL NECCESSARY DEVELOPMENT TOOLS ON UBUNTU (UNIX)
#   apt-get -y install build-essential zlib1g-dev libssl-dev libreadline5-dev libyaml-dev
# fi

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

# brew update
# brew doctor
# brew install libyaml
# brew install tree
# brew install imagemagick
# brew install ssh-copy-id
# brew install proctools

# edit remote files via SSH with Textmate
# gem install rmate

# Textmate2 install
# 
# gitk --all & # - very handy to use and monitor the branch and commits changes
# 
# Security Set the git-shell as the default shell for the git user in /etc/passwd
# /usr/local/bin/git-shell
# 
# Qwandry gives you a single way to easily open all your projects and libraries
# https://github.com/adamsanderson/qwandry

# Install GCC + Git
# mkdir ~/tmp
# cd ~/tmp
# curl https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg > GCC-10.7-v2.pkg
# sudo installer -pkg GCC-10.7-v2.pkg -target /

# chef
# https://github.com/pivotal/pivotal_workstation
# https://github.com/opscode-cookbooks/dmg
