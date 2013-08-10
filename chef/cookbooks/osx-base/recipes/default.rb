execute 'symlink ~/.bash_profile' do
  command "ln -s -f ~/bin/dotfiles/bash_profile #{File.join(node[:homedir], '.bash_profile')}"
  user node[:user]
end

execute 'symlink ~/.bash_logout' do
  command "ln -s -f ~/bin/dotfiles/bash_logout #{File.join(node[:homedir], '.bash_logout')}"
  user node[:user]
end

gem_package 'qwandry' do
  # https://github.com/adamsanderson/qwandry
  action :install
  options '--no-ri --no-rdoc'
end

gem_package 'rmate' do
  action :install
  options '--no-ri --no-rdoc'
end
# execute 'rmate - edit remote files via SSH with Textmate' do
#   command 'gem install rmate --no-ri --no-rdoc'
#   user node[:user]
# end
