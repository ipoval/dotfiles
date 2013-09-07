template "#{node[:homedir]}/.ssh/config" do
  source 'config_ssh.erb'
  owner node[:user]

  variables(identity_file: '~/.ssh/ipovalec2-pkey.pem')
end
