execute 'echo "gem: --no-ri --no-rdoc" > ~/.gemrc'

template "#{node[:homedir]}/.irbrc" do
  source 'irbrc.erb'
  owner node[:user]
end

gem_package 'awesome_print' do
  action :install
  options '--no-ri --no-rdoc'
end

gem_package 'qwandry' do
  # https://github.com/adamsanderson/qwandry
  action :install
  options '--no-ri --no-rdoc'
end

##
# Code metrics tools
#
gem_package 'flog' do
  action :install
  options '--no-ri --no-rdoc'
end

gem_package 'flay' do
  action :install
  options '--no-ri --no-rdoc'
end

gem_package 'rubocop' do
  action :install
  options '--no-ri --no-rdoc'
end
