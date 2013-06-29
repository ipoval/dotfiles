template "#{node[:homedir]}/.ssh/config" do
  source 'config_ssh.erb'
  owner node[:user]
end
