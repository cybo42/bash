function tmuxpwd (){
  tmux new -s $(basename $(pwd))
}

function tmux-ls-tty () {
  tmux list-panes -aF "#{session_name} / #{window_name}: #{pane_tty}"
}

function tmux-window-pwd () {
  tmux rename-window "$(basename $PWD)"
}
