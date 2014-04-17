include_recipe :dmg

unless File.exists?('/usr/local/bin/mate')
  remote_file "/tmp/textmate2.zip" do
    source "http://api.textmate.org/downloads/release"
    owner node[:user]
  end

  execute 'install' do
    command "cd /tmp && tar -xvzf textmate2.zip -C /Applications/"
    command "\rm /tmp/textmate2.zip"
    command "ln -s /Applications/TextMate.app/Contents/MacOS/TextMate /usr/local/bin/mate"
    user node[:user]
  end

  ruby_block "test to see if TextMate.app is installed" do
    block do
      raise "TextMate.app was not installed" unless File.exists?("/Applications/TextMate.app")
    end
  end
end

if returned_404 =  false
  dmg_package "Alfred" do
    volumes_dir "Alfred.app"
    source "http://cachefly.alfredapp.com/alfred_1.3.1_261.dmg"
    checksum "c951c4dc05ff1091359358d710142cabef2c190be41f799244669f879cff7e80"
    owner node[:user]
    action :install
  end
end

dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source "http://www.dropbox.com/download?plat=mac"
  checksum "b4ea620ca22b0517b75753283ceb82326aca8bc3c86212fbf725de6446a96a13"
  action :install
end

dmg_package "Evernote" do
  volumes_dir "Evernote"
  source "http://evernote.com/download/get.php?file=EvernoteMac"
  checksum "5639b8f5f6b5202a1d7e6cffd8ca2a4c11fd0c41f339466272aa7672abb8fd47"
  accept_eula true
  owner node[:user]
  action :install
end

dmg_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
  checksum "7daa2dc5c46d9bfb14f1d7ff4b33884325e5e63e694810adc58f14795165c91a"
  action :install
end

dmg_package "Skype" do
  source "http://download.skype.com/macosx/Skype_6.0.0.2968.dmg"
  checksum "7f53dd799b7b99c70f6b62fde0cb74c4"
  owner node[:user]
  action :install
end

# unless File.exists? '/Applications/Dash.app'
#   remote_file '/tmp/Dash.zip' do
#     source 'http://sanfrancisco.kapeli.com/Dash.zip'
#     owner node[:user]
#     action :create_if_missing
#   end
# end

# dmg_package 'uTorrent' do
#   source 'http://download-new.utorrent.com/endpoint/utmac/os/osx/track/stable/'
#   checksum '2d8cdf4934661f6c28b1f2b343ce5b8411ffddf21ae46159153ce9a464adcba5'
#   type 'pkg'
#   owner node[:user]
#   action :install
# end

execute "Dock position on screen - right" do
  command "defaults write com.apple.dock orientation -string right"
  user node[:user]
end
execute("Dock relaunch") { command "killall Dock" }
