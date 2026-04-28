function tmuxpwd (){
  tmux new -s $(basename $(pwd))
}

function tmux-ls-tty () {
  tmux list-panes -aF "#{session_name} / #{window_index} [#{window_name}] p:#{pane_index}: #{pane_tty}"
}

function tmux-window-pwd () {
  tmux rename-window "$(basename $PWD)"
}
