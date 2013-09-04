package 'nginx' do # apt-get install nginx
  version '1.0.9'
end 

# set up nginx as a service in /etc/init.d/rc.X/...
service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start] # start when OS boots
end

template '/etc/nginx/nginx.conf' do
  notifies :reload, 'service[nginx]'
end
