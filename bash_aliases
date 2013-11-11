alias ls='ls -F --color=auto'
alias lsa='ls -A'

alias c="clear"

function findfiles() {
  find ./ -type f -name $1
}
