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
