# Setup fzf
# ---------
if [[ ! "$PATH" == */home/derek/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/derek/.fzf/bin"
  export FZF_COMPLETION_TRIGGER='~~'
  export FZF_COMPLETION_OPTS='--border --info=inline'
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
fi


# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/derek/.fzf/shell/completion.bash" 2> /dev/null


# Key bindings
# ------------
source "/home/derek/.fzf/shell/key-bindings.bash"


# view man pages
# ------------
fman() {
  man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}


# search for fonts installed on the system
# ------------
ffont() {
  fc-cache && fc-list | awk -F "/" '{ print $NF }' |fzf -q "$1" --prompt='search fonts> '
}


# Interactive folder search.
# Usage: `ff` or `ff <folder>`.
# ------------
ff() {
  [[ -n $1 ]] && cd $1 # go to provided folder or noop
  RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

  selected=$(
  FZF_DEFAULT_COMMAND="rg --files" fzf \
    -m \
    -e \
    --ansi \
    --phony \
    --bind "ctrl-a:select-all" \
    --bind "f12:execute-silent:(subl -b {})" \
    --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
    --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
  )

  [[ -n $selected ]] && nvim $selected # open multiple files in editor
}


# kill processes
# ------------
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{ print $2 }')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{ print $2 }')
  fi

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}


# fbr - checkout git branch
# ------------
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{ print $1 }' | sed "s/.* //")
  }


# pacman install
# ------------
pS() {
  pacman -Slq | fzf -q "$1" -m --preview 'pacman -Si {1}' --prompt='pacman -S > ' | xargs -ro sudo pacman -S
}

# pacman remove
# ------------
pRns() {
  pacman -Qq | fzf -q "$1" -m --preview 'pacman -Qi {1}' --prompt='pacman -Rns > ' | xargs -ro sudo pacman -Rns
}

pQ() {
  pacman -Qq | fzf -q "$1" -m --preview 'pacman -Qi {1}' --prompt='pacman -Q > '
}


# paru install
# ------------
parS() {
  paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}' --prompt='paru -S > ' | xargs -ro paru -S
}


#paru remove
# ------------
parR() {
  paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' --prompt='paru -Rns > ' | xargs -ro paru -Rns
}


# node script
# ------------
ns() {
  local script
  script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf --height 20%) && npm run $(echo "$script")
}


# emoji picker
# ------------
em() {
  local script
  script=$(cat ~/.local/share/emoji | fzf --height 20% -q "$1" | sed "s/ .*//" ) && wl-copy $script
}


# wifi menu
# ------------
wifi(){
  has() {
    local verbose=false
    if [[ $1 == '-v' ]]; then
      verbose=true
      shift
    fi
    for c in "$@"; do c="${c%% *}"
      if ! command -v "$c" &> /dev/null; then
        [[ "$verbose" == true ]] && err "$c not found"
        return 1
      fi
    done
  }

err() {
  printf '\e[31m%s\e[0m\n' "$*" >&2
}

die() {
  (( $# > 0 )) && err "$*"
  exit 1
}

has -v nmcli fzf || die

nmcli -f 'bssid,signal,bars,freq,ssid' --color yes device wifi |
  fzf \
  --with-nth=2.. \
  --ansi \
  --height=40% \
  --reverse \
  --cycle \
  --inline-info \
  --header-lines=1 \
  --bind="enter:execute:nmcli -a device wifi connect {1}"
}



