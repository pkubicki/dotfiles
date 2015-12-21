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

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
