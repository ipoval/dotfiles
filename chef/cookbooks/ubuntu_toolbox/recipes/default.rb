execute 'brew install imagemagick' do
  command 'brew install imagemagick'
  not_if { File.join(node[:homebrew_dir], 'imagemagick/') }
end

execute 'brew install libyaml' do
  command 'brew install libyaml'
  not_if { File.join(node[:homebrew_dir], 'libyaml/') }
end

execute 'brew install tree' do
  command 'brew install tree'
  not_if { File.join(node[:homebrew_dir], 'tree/') }
end

execute 'brew install ssh-copy-id' do
  command 'brew install ssh-copy-id'
  not_if { File.join(node[:homebrew_dir], 'ssh-copy-id/') }
end

execute 'brew install proctools' do
  command 'brew install proctools'
  not_if { File.join(node[:homebrew_dir], 'proctools/') }
end
