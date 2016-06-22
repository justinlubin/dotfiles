export EDITOR=vim

PS1="\[\e[01;35m\]\w \[\e[00;35m\]❯\[\e[01;35m\]❯\[\e[01;37m\]❯\[\e[0m\] "

git config --global user.name "Justin Lubin"
git config --global user.email "jlubi333@gmail.com"
git config --global color.ui true
git config --global push.default simple
git config --global core.excludesfile ~/.gitignore_global


# alias vim="/Users/jlubin/Applications/MacVim.app/Contents/MacOS/Vim"

alias ls="ls -G"
alias la="ls -Ga"
alias nyan="telnet nyancat.dakko.us"
alias vimupdate="vim +PluginInstall +qall"
alias gerudo="mplaymusic ~/Dropbox/Gerudo/gerudo.mp3"
alias clock='while [ 1 ] ; do echo -en "$(date +%T)\r" ; sleep 0.5; done'
alias lz="while [ 1 ] ; do echo '$ ls'; ls; sleep 0.25; done"
alias pipes="~/dotfiles/pipes.sh"
alias s="ssh justin@172.24.10.31"
alias ebash="$EDITOR ~/.bashrc"
alias rbash="source ~/.bashrc"
alias etmux="$EDITOR ~/.tmux.conf"
alias rtmux="tmux source-file ~/.tmux.conf"
alias evim="$EDITOR ~/.vimrc"
alias pythonserver="python3 -m http.server"
alias phpserver="php -S localhost:8000"
alias tsc="tsc --noEmitOnError"

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
	echo "CC = gcc

CFLAGS = -g -Wall
LDFLAGS = -g -lm

$1: $1.o
$1.o: $1.c

.PHONY: clean
clean:
	rm -f *.o $1

.PHONY: all
	all: clean $1
" > Makefile
}

# Make and run
function mrun() {
    make && ./$1
}

function mclean() {
    make clean
}

# Base16 color scheme
BASE16_THEME="ocean.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_THEME.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Launch tmux
if [[ ! $TERM =~ screen  ]]; then
    exec tmux
fi
