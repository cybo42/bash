HISTSIZE=2000
export HISTSIZE

export TERM=xterm-256color

#-----------------------------------------
# Highlight GREP matches
#-----------------------------------------
GREP_COLOR='1;32'
export GREP_COLOR
GREP_OPTIONS=--color=auto
export GREP_OPTIONS

#-----------------------------------------
# Setup LS colors
#-----------------------------------------
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
#export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'
#export LSCOLORS="exfxcxdxcxegedabagacad"

#-------------------------------------------
# Ensure we are using current unix commands
#-------------------------------------------
export COMMAND_MODE=unix2003
#-------------------------------------------
# If need old / legacy support uncomment
#-------------------------------------------
#export COMMAND_MODE=legacy

#-----------------------------------------
# Editor settings
#-----------------------------------------
set -o vi
export VISUAL=vi
export EDITOR=vi

#-----------------------------------------
# Set prompt
#-----------------------------------------
export USER=`whoami`;
export HOST=`hostname -s`;
export PS1='$USER@$HOST[$PWD]==> '


# MAC
JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME
JDK_HOME=$JAVA_HOME
export JDK_HOME
JRE_HOME=$JAVA_HOME
export JRE_HOME

IDEA_JDK=$JAVA_HOME
export IDEA_JDK

#-----------------------------------------
# Put local bin directory in path
#-----------------------------------------
PATH=~/bin:$PATH
export PATH

#-----------------------------------------
# Add WireShark to path
#-----------------------------------------
PATH=$PATH:~/apps/wireshark
export PATH


#-----------------------------------------
# Load rbenv ruby version manager
#-----------------------------------------
function load_rbenv(){
  eval "$(rbenv init -)"
}

#-----------------------------------------
# To help GPG handle passphrases
#-----------------------------------------
export GPG_TTY=$(tty)
