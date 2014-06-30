directory "#{node[:homedir]}/.git_template/hooks" do
  owner node[:user]
  recursive true
  action :create
  only_if { !File.exists?("#{node[:homedir]}/.git_template/hooks") }
end

template "#{node[:homedir]}/.git_template/hooks/pre-commit" do
  source 'git_hook_precommit.erb'
  owner node[:user]
  mode 0777
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
  command "git config --global init.templatedir '#{node[:homedir]}/.git_template/'"
end

template "#{node[:homedir]}/.gitignore" do
  source 'gitignore.erb'
  owner node[:user]
end
