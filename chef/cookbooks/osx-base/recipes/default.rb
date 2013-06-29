execute 'symlink ~/.bash_profile' do
  command "ln -s -f ~/bin/dotfiles/bash_profile #{File.join(node[:homedir], '.bash_profile')}"
  user node[:user]
end

execute 'symlink ~/.bash_logout' do
  command "ln -s -f ~/bin/dotfiles/bash_logout #{File.join(node[:homedir], '.bash_logout')}"
  user node[:user]
end

# https://github.com/adamsanderson/qwandry
execute 'qwandry - single way to open all your projects and libraries' do
  command 'gem install qwandry --no-ri --no-rdoc'
  user node[:user]
end

execute 'rmate - edit remote files via SSH with Textmate' do
  command 'gem install rmate --no-ri --no-rdoc'
  user node[:user]
end
