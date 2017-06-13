
funfact(){
  curl -s  http://randomfunfacts.com |perl -n -e 'print "$1" if /<strong><i>(.*?)<\/i><\/strong>/m';
}


