function tmuxpwd (){
  tmux new -s $(basename $(pwd))
}

