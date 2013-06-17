execute 'symlink ~/.bash_profile' do
  command "ln -s -f ~/bin/dotfiles/bash_profile #{File.join(node[:homedir], '.bash_profile')}"
  user node[:user]
end

execute 'symlink ~/.bash_logout' do
  command "ln -s -f ~/bin/dotfiles/bash_logout #{File.join(node[:homedir], '.bash_logout')}"
  user node[:user]
end

execute '.gitconfig' do
  command 'git config --global user.name ipoval'
  command 'git config --global user.email ivanpoval@gmail.com'
  command 'git config --global push.default current'
  command 'git config --global color.ui auto'
  command 'git config --global color.status auto'
  command 'git config --global color.branch auto'
  command 'git config --global alias.co checkout'
  command 'git config --global help.autocorrect 1'
end

template "#{node[:homedir]}/.gitignore" do
  source 'gitignore.erb'
  owner node[:user]
end

directory "#{node[:homedir]}/.rake/" do
  owner node[:user]
end

template "#{node[:homedir]}/.rake/default.rake" do
  source 'default.rake.erb'
  owner node[:user]
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
