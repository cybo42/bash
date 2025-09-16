export DOCKER_HOME=/Applications/Docker.app/Contents/Resources/bin

export PATH=$DOCKER_HOME:$PATH

function docker-ctx () {
  local context_list
  context_list=$(docker context list)

  echo ""
  echo "---------------------------------------------------\n"
  docker context use $(docker context list -q | fzf --footer "$context_list"  --highlight-line)

}
