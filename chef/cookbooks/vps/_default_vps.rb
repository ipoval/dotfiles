# http://railscasts.com/episodes/339-chef-solo-basics?autoplay=true

package 'git-core' # apt-get install git-core | sudo port install git-core

include_recipe 'nginx::source'

user node[:user][:name] do
  password node[:user][:password]
  gid 'admin'
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end

template "/home/#{node[:user][:name]}/.zshrc" do
  owner node[:user][:name]
end

directory "/home/#{node[:user][:name]}/example" do
  owner node[:user][:name]
end

file "/home/#{node[:user][:name]}/example/index.html" do
  owner node[:user][:name]
  content '<h1>Hello World</h1>'
end

file "#{node[:nginx][:dir]}/sites-available/example" do
  content "server { root /home/#{node[:user][:name]}/example; }"
end

nginx_site 'example'
