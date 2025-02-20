
export GOPATH=$HOME/code/go
pathprepend $GOPATH/bin

function go_list_imports {
  go list -f '{{ join .Imports "\n" }}' $@
}

function go_list_imports_all {
  go list -f '{{ join .Imports "\n" }}' ./... |sort |uniq
}
