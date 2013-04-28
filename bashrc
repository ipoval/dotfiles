source ~/bin/dotfiles/bash/functions
source ~/bin/dotfiles/bash/aliases
source ~/bin/dotfiles/bash/config
source ~/bin/dotfiles/bash/env

# create global .rake folder for global rake tasks
if [ -d '~/.rake' ]
  then
    echo '*** global ~/.rake/ folder exists ***'
  else
    mkdir ~/.rake/
(\cat << CODE
#!/usr/bin/env ruby

task :default => :default_rake_task

task :default_rake_task do
  require 'etc'
  puts Etc.getlogin
end
CODE
) > ~/.rake/default.rake
    echo '*** created global ~/.rake/ to be run with "rake -g name_of_rake_task" ***'
fi

psysinfo;
