# tmux
execute 'brew install tmux' do
  not_if 'which tmux'
end
