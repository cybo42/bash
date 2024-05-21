
function _update_ps1() {
    PS1="$(~/apps/powerline-go/powerline-go \
      -cwd-max-depth 3 \
      -newline \
      -numeric-exit-codes \
      -modules "venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,node,aws" -error $?
    )"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


