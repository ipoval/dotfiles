source ~/bin/dotfiles/bash/functions
source ~/bin/dotfiles/bash/aliases
source ~/bin/dotfiles/bash/config
source ~/bin/dotfiles/bash/env

# cd -; to pick up the dir you logged out from shell
OLDPWD=$(cat ~/.pwd)

psysinfo;

function launch_tmux() {
  if [ -n "$(which tmux)" ]
  then
    echo '1. PREPARING SCREEN'
    # tmux
  else
    brew install tmux
  fi
}

function launch_screen() {
  if ! screen -ls | grep ipoval; then
    echo '2. LAUNCHING SCREEN SESSION ipoval OR CONNECTING TO EXISTING ONE'
    screen -R ipoval
  fi
}

launch_tmux
launch_screen
