#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]'

# git completion
source /usr/share/git/completion/git-completion.bash

# Load RVM into a shell session *as a function*
[[ -s "/home/pkubicki/.rvm/scripts/rvm" ]] && source "/home/pkubicki/.rvm/scripts/rvm" 

# RVM completion 
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# RVM prompt
PS1="$PS1 
[\$(~/.rvm/bin/rvm-prompt i v p g s)]\$ "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

