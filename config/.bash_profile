#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export WM="river"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PAGER="bat --paging always"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_DATA_HOME"/bash/history
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GOPATH="$XDG_DATA_HOME"/go

export PATH="$PATH:/home/derek/.local/bin:/home/derek/.local/share/cargo/bin:/home/derek/.local/share/go/bin:/home/derek/.luarocks/bin"

if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# if [ "$(tty)" = "/dev/tty1" ]; then
#   exec sway
# fi

# if [ "$(tty)" = "/dev/tty1" ]; then
# 	exec dwl -s dwlapps
# fi

# if [ "$(tty)" = "/dev/tty1" ]; then
# 	exec kiwmi
# fi

if [ "$(tty)" = "/dev/tty1" ]; then
  exec river
fi
