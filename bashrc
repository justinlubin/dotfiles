# Path
PATH=~/.cabal/bin:~/bin:$PATH

# Editor
export EDITOR="vim"

# Python Virtual Environment
if [ -d "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export PIP_REQUIRE_VIRTUALENV="true"
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/Documents"
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    source "/usr/local/bin/virtualenvwrapper.sh"
fi

# Android SDK
if [ -d "/usr/local/opt/android-sdk" ]; then
    export ANDROID_HOME="/usr/local/opt/android-sdk"
fi

# Colors
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
pink="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"
gray="$(tput setaf 8)"

bold="$(tput bold)"
reset="$(tput sgr0)"

function __parse_git_branch() {
    if [[ -z $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        return
    fi

    local untracked=$(git status 2> /dev/null | grep "Untracked files")
    local notstaged=$(git status 2> /dev/null | grep "Changes not staged for commit")
    local staged=$(git status 2> /dev/null | grep "Changes to be committed")
    local ahead=$(git status 2> /dev/null | grep "Your branch is ahead")

    printf ' \[${blue}\]('
    # http://mfitzp.io/article/add-git-branch-name-to-terminal-prompt-mac/
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | tr -d '\n'
    if [[ $untracked ]]; then
        printf '\[${yellow}\]?'
    fi
    if [[ $notstaged ]]; then
        printf '\[${red}\]*'
    fi
    if [[ $staged ]]; then
        printf '\[${green}\]+'
    fi
    if [[ $ahead ]]; then
        printf '\[${pink}\]>'
    fi
    printf '\[${blue}\])'
}

if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
    is_ssh="1"
fi

# Prompt
function set_bash_prompt() {
    PS1="\[${bold}${pink}\]\w$(__parse_git_branch) \[${pink}\]❯❯\[${white}\]❯\[${reset}\] "
}

function set_bash_prompt_ssh() {
    PS1="\[${bold}${red}(SSH) ${pink}\]\w$(__parse_git_branch) \[${pink}\]❯❯\[${white}\]❯\[${reset}\] "
}

if [[ $is_ssh ]]; then
    PROMPT_COMMAND=set_bash_prompt_ssh
else
    PROMPT_COMMAND=set_bash_prompt
fi

# Git
git config --global user.name "Justin Lubin"
git config --global user.email "jlubi333@gmail.com"
git config --global color.ui true
git config --global push.default simple
git config --global core.excludesfile ~/.gitignore
git config --global credential.helper osxkeychain

# Better Vim
if [ -d "/Applications/MacVim.app/Contents/MacOS" ]; then
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

# Aliases
alias ls="ls -G"
alias la="ls -Ga"
alias nyan="telnet nyancat.dakko.us"
alias vimupdate="vim +PluginInstall +qall"
alias gerudo="mplaymusic ~/Dropbox/Gerudo/gerudo.mp3"
alias wano="mplaymusic ~/Dropbox/WANO/wano.mp3"
alias wanof="mplaymusic ~/Dropbox/WANO/Wano_Fugue_II.mp3"
alias clock='while [ 1 ] ; do echo -en "$(date +%T)\r" ; sleep 0.5; done'
alias lz="while [ 1 ] ; do echo '$ ls'; ls; sleep 0.25; done"
alias pipes="~/dotfiles/pipes.sh"
alias sss="ssh justin@172.24.10.31"
alias csil="ssh justinlubin@linux.cs.uchicago.edu"
alias seel="ssh justinlubin@seel.cs.uchicago.edu"
alias muk="ssh justinlubin@muk.cs.uchicago.edu"
alias csilm="mosh justinlubin@linux.cs.uchicago.edu"
alias ebash="$EDITOR ~/.bashrc"
alias rbash="source ~/.bashrc"
alias etmux="$EDITOR ~/.tmux.conf"
alias rtmux="tmux source-file ~/.tmux.conf"
alias evim="$EDITOR ~/.vimrc"
alias pythonserver="python3 -m http.server"
alias phpserver="php -S localhost:8000"
alias cmsc161="cd ~/Google\ Drive/College/Year\ 1/Q1\ \(Autumn\ Quarter\)/CMSC\ 161/"
alias cmsc162="cd ~/Google\ Drive/College/Year\ 1/Q2\ \(Winter\ Quarter\)/CMSC\ 162/"
alias cmsc154="cd ~/Google\ Drive/College/Year\ 1/Q3\ \(Spring\ Quarter\)/CMSC\ 15400/"
alias shorten="export PROMPT_COMMAND=\"\"; PS1=\"\W $ \""

# Play music on Mac
function mplaymusic() {
    afplay $1 &
}

# Stop music playing on Mac
function mstopmusic() {
    killall afplay
}

# Generate a ghetto Makefile
function ghettomake() {
    echo $1: > Makefile
}

# Generate a proper Makefile
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

# Make and run
function mrun() {
    make && ./$1
}

function mclean() {
    make clean
}

# Make tsconfig
function mts() {
cat <<EOF >tsconfig.json
{
    "compilerOptions": {
        "noEmitOnError": true,
        "noImplicitAny": true,
        "noImplicitReturns": true
    }
}
EOF
}

# Base16 color scheme
BASE16_THEME="ocean.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_THEME.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Launch tmux on startup
# if [[ ! $TERM =~ screen  ]]; then
#     exec tmux
# fi
