#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# original bashrc
source ~/dotfiles_old/.bashrc

# Load RVM into a shell session *as a function*
[[ -s "/home/pkubicki/.rvm/scripts/rvm" ]] && source "/home/pkubicki/.rvm/scripts/rvm"

# RVM completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# enables bash alises file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# vi style editing
set -o vi

# prompt
export PS1="[\[\033[0;34m\]\u@\h \[\033[0;36m\]\$(~/.rvm/bin/rvm-prompt i v p g s)\[\033[0m\]]
[\[\033[0;32m\]\W\[\033[0;33m\]\$(__git_ps1)\[\033[0m\]]\$ "
