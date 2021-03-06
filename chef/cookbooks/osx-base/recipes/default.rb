execute 'symlink ~/.bash_profile' do
  command "ln -s -f ~/bin/dotfiles/bash_profile #{File.join(node[:homedir], '.bash_profile')}"
  user node[:user]
end

execute 'symlink ~/.bash_logout' do
  command "ln -s -f ~/bin/dotfiles/bash_logout #{File.join(node[:homedir], '.bash_logout')}"
  user node[:user]
end

gem_package 'rmate' do
  action :install
  options '--no-ri --no-rdoc'
end
