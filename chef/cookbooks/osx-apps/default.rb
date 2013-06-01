execute "set dock to be on left" do
  command "defaults write com.apple.dock orientation -string left"
  user node['user']
end

execute "relaunch dock" do
  command "killall Dock"
end
