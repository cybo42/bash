
srcFile=$DOT_GEN/mise.rc

#mytty=$(tty)
#touch "/tmp/hello-$(basename $mytty)-$$"

mise activate bash > $srcFile
source $srcFile
