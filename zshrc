################################################################################
# Paths
################################################################################

PATH=~/.local/bin:~/.cabal/bin:~/bin:~/.cargo/bin:~/Library/Python/2.7/bin:$PATH

################################################################################
# Global Variables
################################################################################

# Editor
export EDITOR="vim"

################################################################################
# PS1
################################################################################

# Red: 1
# Green: 2
# Yellow: 3
# Blue: 4
# Pink: 5
# Cyan: 6
# White: 7
# Gray: 8

__parse_git_branch() {
    if [[ -z $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        return
    fi

    local untracked=$(git status 2> /dev/null | grep "Untracked files")
    local notstaged=$(git status 2> /dev/null | grep "Changes not staged for commit")
    local staged=$(git status 2> /dev/null | grep "Changes to be committed")
    local ahead=$(git status 2> /dev/null | grep "Your branch is ahead")

    printf ' %%4F('
    # http://mfitzp.io/article/add-git-branch-name-to-terminal-prompt-mac/
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | tr -d '\n'
    if [[ $untracked ]]; then
        printf '%%3F?'
    fi
    if [[ $notstaged ]]; then
        printf '%%1F*'
    fi
    if [[ $staged ]]; then
        printf '%%2F+'
    fi
    if [[ $ahead ]]; then
        printf '%%5F>'
    fi
    printf '%%4F)'
}

precmd() {
    PS1="%8F[%M] %5F%~$(__parse_git_branch)"$'\n'"%5F>>> %f"
}

################################################################################
# Aliases and functions
################################################################################

alias ls="ls -G"
alias viminstall="vim +PlugInstall"
alias vimupdate="vim +PlugUpdate"
alias gerudo="mplaymusic ~/Dropbox/Gerudo/gerudo.mp3"
alias clock='while [ 1 ] ; do echo -en "$(date +%T)\r" ; sleep 0.5; done'
alias lz="while [ 1 ] ; do echo '$ ls'; ls; sleep 0.25; done"
alias pipes="~/dotfiles/pipes.sh"
alias ezsh="$EDITOR ~/.zshrc"
alias rezsh="source ~/.zshrc"
alias etmux="$EDITOR ~/.tmux.conf"
alias retmux="tmux source-file ~/.tmux.conf"
alias evim="$EDITOR ~/.vimrc"
alias shorten="function precmd() { PS1='%2F$ %f' }"
alias tinit="tmux new-session -A -s init \; new-window rebash && retmux"
alias takeover="tmux detach -a"
alias sserver="python3 -m http.server 7532" # Simple server
alias lserver="live-server --port=7532 --no-browser" # Live server
alias tinyvim="vim -u ~/.tinyvimrc"
alias line80="echo \"--------------------------------------------------------------------------------\""
alias tb="nc termbin.com 9999"
alias emacs="emacs -nw"
alias openv='eval $(opam env)'
alias ocamls='cd `ocamlc -where`'
alias ffind="find . -name"

agreplace() {
  ag -0 -l "$1" | xargs -0 perl -pi.bak -e "s/$1/$2/g"
}

livetex() {
  fswatch -0 *.tex | xargs -0 -n 1 -I {} make $1
}

skim() {
  open -a Skim $1 &
}

rememberssh() {
  killall ssh-agent -u justinlubin
  eval `ssh-agent -s`
  ssh-add -K ~/.ssh/id_rsa
}

_sizes_helper() {
  ls -1 | while read -r f; do
    du -sh "$f"
  done | sort -h -b -r
}

sizes() {
  if [ -z "$1" ]; then
    _sizes_helper
  else
    _sizes_helper | head -$1
  fi;
}

# Play music on Mac
mplaymusic() {
    afplay $1 &
}

# Stop music playing on Mac
mstopmusic() {
    killall afplay
}

# Fuzzy git diff
gdiff() {
  git diff "*$1*"
}

################################################################################
# Shell Configuration
################################################################################

# Base 16 Color Scheme

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

################################################################################
# Launching
################################################################################

# OCaml
if type "opam" > /dev/null; then
  openv
fi

# Launch tmux on startup
if [[ ! $TERM =~ "screen" ]]; then
    tinit
fi
