execute "symlink ~/.bash_profile" do
  command "ln -s -f ~/bin/dotfiles/bash_profile #{File.join(node[:homedir], '.bash_profile')}"
  user node['user']
end

execute "symlink ~/.bash_logout" do
  command "ln -s -f ~/bin/dotfiles/bash_logout #{File.join(node[:homedir], '.bash_logout')}"
  user node['user']
end

directory "#{node[:homedir]}/.rake/" do
  owner node[:user]
end

template "#{node[:homedir]}/.rake/default.rake" do
  source "default.rake.erb"
  owner node[:user]
end

# https://github.com/adamsanderson/qwandry
execute "qwandry - single way to open all your projects and libraries" do
  command "gem install qwandry --no-ri --no-rdoc"
  user node['user']
end

execute "rmate - edit remote files via SSH with Textmate" do
  command "gem install rmate --no-ri --no-rdoc"
  user node['user']
end

# Mac OS
# dmg_package "Google Chrome" do
#   dmg_name "googlechrome"
#   source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
#   checksum "7daa2dc5c46d9bfb14f1d7ff4b33884325e5e63e694810adc58f14795165c91a"
#   action :install
# end
# dmg_package "Dropbox" do
#   volumes_dir "Dropbox Installer"
#   source "http://www.dropbox.com/download?plat=mac"
#   checksum "b4ea620ca22b0517b75753283ceb82326aca8bc3c86212fbf725de6446a96a13"
#   action :install
# end

execute "set dock to be on left" do
  command "defaults write com.apple.dock orientation -string left"
  user node['user']
end

execute "relaunch dock" do
  command "killall Dock"
end
