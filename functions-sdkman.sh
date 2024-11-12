
function sdkjava(){
  sdk use java $(sdk list java | grep 'installed\|local only' | grep -v '>>>' | awk '{print $NF}' | fzf)
}

