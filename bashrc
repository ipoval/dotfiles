source ~/bin/dotfiles/bash/functions
source ~/bin/dotfiles/bash/aliases
source ~/bin/dotfiles/bash/config
source ~/bin/dotfiles/bash/env

# cd -; to pick up the dir you logged out from shell
OLDPWD=$(cat ~/.pwd)

psysinfo;

# launch tmux
if [ -n "$(which tmux)" ]
then
  tmux
else
  brew install tmux
fi
