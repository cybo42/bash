# Print epoch time to STDOUT
function epoch {
  if [ "x$1" == "x-v" ];then
    date "+%s %Y-%m-%d %H:%M:%S"
  else
    date +"%s"
  fi
}

function epoch2dt {
  date -j -r $1
}

function dt(){
  date +%Y-%m-%d
}

function dtt(){
  date +%Y-%m-%dT%H.%M.%S
}

function dtiso(){
  date -u +%Y-%m-%dT%H:%M:%S%z
}

function juliandt(){
  date +%j
}


