function switchVersion(){
  local BASE_DIR=$1
  local HOME_NAME=$2
  local CHECK_CMD=$3
  local BIN_DIR
  local BIN_DIR=${4:-bin}

  local i
  local VER
  local CURRENT_VER

  declare -a ALL_VERSIONS=(${BASE_DIR}*)
  echo "Versions:"
  for ((i=0; i<${#ALL_VERSIONS[@]}; i++))
  do
    test "${ALL_VERSIONS[$i]}" && printf "%3d - %s\n" $((i+1)) "${ALL_VERSIONS[$i]}" 1>&2
  done

  read -p "Choose version: " VER
  while [ "x$VER" == "x" ];do
    read -p "INVALID CHOICE: Choose enviroment: " VER
  done

  echo "Selected $VER -> ${ALL_VERSIONS[$VER - 1]}"
  echo ""

  CURRENT_VER=$(dirname $(which $CHECK_CMD))
  if [ "x$CURRENT_VER" != "x" ];then
    echo "found $CHECK_CMD in $CURRENT_VER removing"
    pathremove $CURRENT_VER
    #echo "Unsetting " $`$HOME_NAME`
    unset $HOME_NAME
  fi

  echo ""
  echo "Setting ${HOME_NAME}=${ALL_VERSIONS[$VER - 1]}"
  export $HOME_NAME=${ALL_VERSIONS[$VER - 1]}
  echo "Adding ${ALL_VERSIONS[$VER - 1]}/${BIN_DIR} to PATH"

  pathprepend ${ALL_VERSIONS[$VER - 1]}/${BIN_DIR}

}


