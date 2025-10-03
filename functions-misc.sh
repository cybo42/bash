
funfact(){
  curl -s  http://randomfunfacts.com |perl -n -e 'print "$1" if /<strong><i>(.*?)<\/i><\/strong>/m';
}

function cdmkdir(){
  mkdir -p "$@" && cd $_;
}

function cdfz() {
  cd $(\ls -1d */ |fzf)
}

hl () 
{ 
    perl -pe "s/$1/\e[0;30;42m$&\e[0m/g"
}

hlg () {
  grep --color=always -E "$1|$"
}

# Gradle helper
function gr() {
  echo "GRADLE_USER_HOME=${GRADLE_USER_HOME:-$HOME/.gradle}"
  if [ -x './gradlew' ];then
    ./gradlew $@
  else
    gradle $@
  fi
}

function vigrp() {
  vi "${GRADLE_USER_HOME:-$HOME/.gradle}/gradle.properties"
}

function curl-status-code () {
  curl -s -o /dev/null -w "%{http_code}\n" "$1"
}
