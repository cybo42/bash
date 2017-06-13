
killregex(){
  local REGEX
  local SIGNUM
  REGEX=$1

  if [ "x$2" != "x" ];then
    SIGNUM=$1
    REGEX=$2
  fi

  if [ "x$REGEX" == "x" ];then
    echo "Must specify regex"

  else
    if [ "x$SIGNUM" == "x" ];then
      echo "Killing procs with that match: $REGEX"
    else
      echo "Killing procs with SIG[$SIGNUM] that match: $REGEX"
    fi
    ps -ef |grep -e "$REGEX" |grep -v grep |awk '{print $2}' |xargs kill $SIGNUM
  fi
}


