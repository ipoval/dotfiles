should_brew = ->(brew_library) { File.exists? File.join(node[:homebrew_dir], brew_library) }

execute 'brew install node and npm' do
  command 'brew install node'
  not_if { should_brew.call 'node' }
end

execute 'brew install imagemagick' do
  command 'brew install imagemagick'
  not_if { should_brew.call 'imagemagick' }
end

# execute 'brew install libyaml' do
#   command 'brew install libyaml'
#   not_if { File.exists? File.join(node[:homebrew_dir], 'libyaml/') }
# end

execute 'brew install htop' do
  command 'brew install htop'
  not_if { should_brew.call 'htop' }
end

execute 'brew install tree' do
  command 'brew install tree'
  not_if { should_brew.call 'tree' }
end

execute 'brew install ssh-copy-id' do
  command 'brew install ssh-copy-id'
  not_if { should_brew.call 'ssh-copy-id' }
end

execute 'brew install proctools' do
  command 'brew install proctools'
  not_if { should_brew.call 'proctools' }
end

execute 'brew install graphviz' do
  command 'brew install graphviz'
  not_if { should_brew.call 'graphviz' }
end

execute 'brew install nmap' do
  command 'brew install nmap'
  not_if { should_brew.call 'nmap' }
end

execute 'brew install psgrep' do
  command 'brew install psgrep'
  not_if { should_brew.call 'psgrep' }
  notifies :run, 'execute[pidof]', :immediately
  notifies :run, 'execute[pstree]', :immediately
end
execute 'pidof' do
  command 'brew install pidof'
  action :nothing
end
execute 'pstree' do
  command 'brew install pstree'
  action :nothing
end
