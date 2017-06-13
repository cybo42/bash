function jvm(){
  local VER
  local VER=${1:-8}

  echo "============================================"
  echo "Current: "
  echo "  JAVA_HOME: $JAVA_HOME"
  java -version

  if [ "x$JAVA_HOME" -ne "x" ];then
    pathremove $JAVA_HOME/bin
    unset JAVA_HOME
  fi

  echo ""
  echo "--------------------------------------------"
  echo "Switching to Java $VER"
  JAVA_HOME=`/usr/libexec/java_home -v 1.${VER}`
  export JAVA_HOME

  pathprepend $JAVA_HOME/bin

  echo "JAVA_HOME: $JAVA_HOME"
  java -version
  echo "============================================"

}


