
#标记目录，快速跳转
function _mark() {
  if [ "$#" -eq 0 ]; then
    export MARK_PATH=$(pwd)
  elif [ "$#" -eq 1 ]; then
    cd $1
    export MARK_PATH=$(pwd)
    cd -
  elif [ "$#" -eq 2 ]; then
    cd $2
    export "MARK_PATH_$1"=$(pwd)
    cd -
  fi
}
function _go() {
  if [ "$#" -eq 1 ]; then
    eval cd '$'"MARK_PATH_$1"
  else
    cd $MARK_PATH
  fi
}
alias mark='_mark'
alias go='_go'
