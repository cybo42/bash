
funfact(){
  curl -s  http://randomfunfacts.com |perl -n -e 'print "$1" if /<strong><i>(.*?)<\/i><\/strong>/m';
}

function cdmkdir(){
  mkdir -p "$@" && cd $_;
}


hl () 
{ 
    perl -pe "s/$1/\e[0;30;42m$&\e[0m/g"
}
