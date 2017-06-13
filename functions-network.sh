alias dig="dig +noall +answer"

function outsideip(){
  dig +short myip.opendns.com @resolver1.opendns.com
}


