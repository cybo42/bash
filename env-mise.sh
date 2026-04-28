
srcFile=$DOT_GEN/mise.rc

#mytty=$(tty)
#touch "/tmp/hello-$(basename $mytty)-$$"

mise activate bash > $srcFile
source $srcFile

## Fix for issue with cursor cli (cursor-agent) not able to find the function for shell commands
[[ $(type -t __zsh_like_cd) == function ]] && export -f __zsh_like_cd
