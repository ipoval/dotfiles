directory "#{node[:homedir]}/.rake/" do
  owner node[:user]
end

template "#{node[:homedir]}/.rake/default.rake" do
  source 'default.rake.erb'
  owner node[:user]
end
