if [ -f ~/bin/dotfiles/bashrc ];
then
  source ~/bin/dotfiles/bashrc
fi

# Gobbler & Chef
source ~/src/mam/config/mam-profile.bash
source ~/src/mam_chef/scripts/mam_chef.bash

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
