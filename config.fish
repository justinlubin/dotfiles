# Path

set -gx PATH \
  ~/.local/bin \
  ~/.cabal/bin \
  ~/bin \
  ~/.cargo/bin \
  ~/Library/Python/2.7/bin \
  $PATH

# Global variables

set -gx EDITOR 'vim'

# Shell configuration

set fish_greeting

if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

# Prompt

function git_prompt
  if test -z (git rev-parse --is-inside-work-tree 2> /dev/null)
    return
  end

  set -l untracked (git status 2> /dev/null | grep 'Untracked files')
  set -l not_staged (git status 2> /dev/null | grep 'Changes not staged for commit')
  set -l staged (git status 2> /dev/null | grep 'Changes to be committed')
  set -l ahead (git status 2> /dev/null | grep 'Your branch is ahead')

  echo -ns (set_color blue) ' ('

  # http://mfitzp.io/article/add-git-branch-name-to-terminal-prompt-mac/
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | tr -d '\n'

  if test -n "$untracked"
    echo -ns (set_color yellow) '?'
  end
  if test -n "$not_staged"
    echo -ns (set_color red) '*'
  end
  if test -n "$staged"
    echo -ns (set_color green) '+'
  end
  if test -n "$ahead"
    echo -ns (set_color magenta) '>'
  end

  echo -ns (set_color blue) ')'
end

function status_prompt
  if test "$argv[1]" -ne 0
    echo -ns (set_color red) " [" $argv[1] "]"
  end
end

set -g fish_prompt_pwd_dir_length 0

function fish_prompt
  set -l previous_status $status
  set_color brblack
  echo -ens \
    (set_color brblack) "[" (hostname) "] " \
    (set_color magenta) (prompt_pwd) \
    (git_prompt) \
    (status_prompt $previous_status) \
    (set_color magenta) '\n>>> ' \
    (set_color normal)
end

# Aliases

alias ls "ls -G"
alias viminstall "vim +PlugInstall"
alias vimupdate "vim +PlugUpdate"
alias gerudo "mplaymusic ~/Dropbox/Gerudo/gerudo.mp3"
alias pipes "~/dotfiles/pipes.sh"
alias efish "$EDITOR ~/.config/fish/config.fish"
alias refish "source ~/.config/fish/config.fish"
alias etmux "$EDITOR ~/.tmux.conf"
alias retmux "tmux source-file ~/.tmux.conf"
alias evim "$EDITOR ~/.vimrc"
alias tinit "tmux new-session -A -s init \; new-window rebash && retmux"
alias takeover "tmux detach -a"
alias sserver "python3 -m http.server 7532" # Simple server
alias lserver "live-server --port=7532 --no-browser" # Live server
alias tinyvim "vim -u ~/.tinyvimrc"
alias line80 "echo \"--------------------------------------------------------------------------------\""
alias tb "nc termbin.com 9999"
alias emacs "emacs -nw"
alias openv 'eval (opam env)'
alias ocamls 'cd `ocamlc -where`'
alias ffind "find . -name"

# Functions

function livetex
  fswatch -0 *.tex | xargs -0 -n 1 -I {} make $argv[1]
end

function skim
  open -a Skim $argv[1] &
end

function _sizes_helper
  ls -1 | while read -r f
    du -sh "$f"
  end | sort -h -b -r
end

function sizes
  if test -z "$1" then
    _sizes_helper
  else
    _sizes_helper | head -$1
  end
end

function mplaymusic
  afplay $1 &
end

function mstopmusic
  killall afplay
end

function gdiff
  git diff "*$1*"
end

# OCaml

if type "opam" > /dev/null 2> /dev/null
  openv
end

# Launch tmux on startup

switch $TERM
  case "screen*"
    true # do nothing
  case "*"
    tinit
end
