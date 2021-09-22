#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# PS1='[\u@\h \W]\$ '

# Load Bash Aliases
[ -f ~/.config/bash/aliases ] && source ~/.config/bash/aliases

# Load LF stuff
[ -f ~/.config/lf/lf-colors ] && source ~/.config/lf/lf-colors
[ -f ~/.config/lf/lf-icons ] && source ~/.config/lf/lf-icons

# Load Cargo env
[ -f ~/.local/share/cargo/env ] && source /home/derek/.local/share/cargo/env

# Load fzf bash completions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

neofetch
eval "$(starship init bash)"
