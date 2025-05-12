#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

eval "$(starship init bash)"
