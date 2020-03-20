################################################################################
# Paths
################################################################################

PATH=~/.local/bin:~/.cabal/bin:~/bin:~/.cargo/bin:$PATH

# Android SDK
if [ -d "/usr/local/opt/android-sdk" ]; then
    export ANDROID_HOME="/usr/local/opt/android-sdk"
fi

# Better vim
if [ -d "/Applications/MacVim.app/Contents/MacOS" ]; then
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

################################################################################
# Global Variables
################################################################################

# Editor
export EDITOR="vim"

# tmux weirdness
export EVENT_NOKQUEUE=1

# Colors
if [[ $- == *i* ]]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  PINK="$(tput setaf 5)"
  CYAN="$(tput setaf 6)"
  WHITE="$(tput setaf 7)"
  GRAY="$(tput setaf 8)"

  BOLD="$(tput bold)"
  RESET_COLOR="$(tput sgr0)"
fi

################################################################################
# PS1
################################################################################

function __parse_git_branch() {
    if [[ -z $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        return
    fi

    local untracked=$(git status 2> /dev/null | grep "Untracked files")
    local notstaged=$(git status 2> /dev/null | grep "Changes not staged for commit")
    local staged=$(git status 2> /dev/null | grep "Changes to be committed")
    local ahead=$(git status 2> /dev/null | grep "Your branch is ahead")

    printf ' \[${BLUE}\]('
    # http://mfitzp.io/article/add-git-branch-name-to-terminal-prompt-mac/
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | tr -d '\n'
    if [[ $untracked ]]; then
        printf '\[${YELLOW}\]?'
    fi
    if [[ $notstaged ]]; then
        printf '\[${RED}\]*'
    fi
    if [[ $staged ]]; then
        printf '\[${GREEN}\]+'
    fi
    if [[ $ahead ]]; then
        printf '\[${PINK}\]>'
    fi
    printf '\[${BLUE}\])'
}

function set_bash_prompt() {
    PS1="\[${GRAY}\][\h] \[${PINK}\]\w$(__parse_git_branch)\n\[${PINK}\]>>\[${WHITE}\]> \[${RESET_COLOR}\]"
}

PROMPT_COMMAND=set_bash_prompt

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
alias csil="ssh justinlubin@linux3.cs.uchicago.edu -L 7532:localhost:7532"
alias seel="ssh justinlubin@seel.cs.uchicago.edu"
alias muk="ssh justinlubin@muk.cs.uchicago.edu"
alias ebash="$EDITOR ~/.bashrc"
alias rebash="source ~/.bashrc"
alias ebashl="$EDITOR ~/.local_bashrc"
alias rebashl="source ~/.local_bashrc"
alias etmux="$EDITOR ~/.tmux.conf"
alias retmux="tmux source-file ~/.tmux.conf"
alias evim="$EDITOR ~/.vimrc"
alias shorten="export PROMPT_COMMAND=\"\"; PS1=\"\W $ \""
alias tinit="tmux new-session -A -s init \; new-window rebash && retmux"
alias takeover="tmux detach -a"
# Simple server
alias sserver="python3 -m http.server 7532"
# Live server
alias lserver="live-server --port=7532 --no-browser"
alias tinyvim="vim -u ~/.tinyvimrc"
alias line80="echo \"--------------------------------------------------------------------------------\""
alias smlr="rlwrap sml"
alias tb="nc termbin.com 9999"
alias emacs="emacs -nw"
alias openv='eval $(opam env)'

function livetex() {
  fswatch -0 *.tex | xargs -0 -n 1 -I {} make $1
}

function skim() {
  open -a Skim $1 &
}

function rememberssh() {
  killall ssh-agent -u justinlubin
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_rsa
}

function sizes_helper() {
  ls -1 | while read -r f; do
    du -sh "$f"
  done | sort -h -b -r 
}

function sizes() {
  if [ -z "$1" ]; then
    sizes_helper
  else
    sizes_helper | head -$1
  fi;
}

# Play music on Mac
function mplaymusic() {
    afplay $1 &
}

# Stop music playing on Mac
function mstopmusic() {
    killall afplay
}

# Generate a proper C Makefile
function mm() {
cat <<EOF >Makefile
CC = gcc

CFLAGS = -g -Wall
LDFLAGS = -g -lm

$1: $1.o
$1.o: $1.c

.PHONY: clean
clean:
	rm -f *.o $1

.PHONY: all
	all: clean $1
EOF
}

# Fuzzy git diff
function gdiff() {
  git diff "*$1*"
}
################################################################################
# Shell Configuration
################################################################################

# Base 16 Color Scheme

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Bash completion

if [ -x "$(command -v brew)" ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Disable tilde expansion

__expand_tilde_by_ref() {
  return 0
}

_expand() {
  return 0
}

################################################################################
# Local Configuration
################################################################################

if [ -e "$HOME/.local_bashrc" ]; then
    source "$HOME/.local_bashrc"
fi

################################################################################
# Launching
################################################################################

# Launch tmux on startup
if [[ ! $TERM =~ "screen" ]]; then
    tinit
fi
