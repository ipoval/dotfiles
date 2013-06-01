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
gem install chef --no-ri --no-rdoc
# gem install ruby-shadow --no-ri --no-rdoc

# brew update
# brew doctor
# brew install libyaml
# brew install tree
# brew install imagemagick

# # edit remote files via SSH with Textmate
# gem install rmate
