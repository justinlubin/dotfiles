# Path

set -gx PATH \
  ~/.local/bin \
  ~/.cabal/bin \
  ~/bin \
  ~/.cargo/bin \
  ~/.elan/bin \
  $PATH

# Global variables

set -gx EDITOR 'vim'
set -gx FZF_DEFAULT_COMMAND 'rg --files'

# Set more environment variables

source "$HOME/.env"

# Shell configuration

set -l in_iterm (string match "iTerm.app" "$TERM_PROGRAM")
set -l in_tmux (string match "screen*" "$TERM")

set fish_greeting

if test \( -n "$in_iterm" \)
  if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
  end
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
    (set_color brblack) " [" "$CMD_DURATION" "ms]" \
    (status_prompt $previous_status) \
    (set_color magenta) '\n>>> ' \
    (set_color normal)
end

# !! and !$

function bind_bang
  switch (commandline -t)[-1]
    case "!"
      commandline -t $history[1]; commandline -f repaint
    case "*"
      commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)[-1]
    case "!"
      commandline -t ""
      commandline -f history-token-search-backward
    case "*"
      commandline -i '$'
  end
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end

# Aliases

alias ls "ls -G"

alias viminstall "vim +PlugInstall"
alias vimupdate "vim +PlugUpdate"
alias pipes "~/dotfiles/pipes.sh"
alias efish "$EDITOR ~/.config/fish/config.fish"
alias refish "source ~/.config/fish/config.fish"
alias etmux "$EDITOR ~/.tmux.conf"
alias retmux "tmux source-file ~/.tmux.conf"
alias evim "$EDITOR ~/.vimrc"
alias tinit "tmux new-session -A -s init"
alias takeover "tmux detach -a"
alias sserver "python3 -m http.server 7532" # Simple server
alias lserver "live-server --port=7532 --no-browser" # Live server
alias tinyvim "vim -u ~/.tinyvimrc"
alias line80 "echo \"--------------------------------------------------------------------------------\""
alias openv 'eval (opam env)'
alias ocamls 'cd `ocamlc -where`'
alias ffind "find . -name"
alias va "source .venv/bin/activate.fish"

# Functions

function skim
  open -a Skim $argv[1] &
end

function _sizes_helper
  for f in (ls -1);
    du -sh "$f"
  end | sort -h -b -r
end

function sizes
  if test -z "$argv[1]"
    _sizes_helper
  else
    _sizes_helper | head -$argv[1]
  end
end

function py
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  eval /Users/jlubin/.micromamba/bin/conda "shell.fish" "hook" $argv | source

  if test -f "/Users/jlubin/.micromamba/etc/fish/conf.d/mamba.fish"
      source "/Users/jlubin/.micromamba/etc/fish/conf.d/mamba.fish"
  end
  # <<< conda initialize <<<
  conda activate scratch
end

function pyc
  py && conda activate $argv[1]
end

# https://stackoverflow.com/a/16673745
function read_confirm_n
  while true
    set -l prompt (echo -ns "$argv[1] [y/N] " (set_color normal))
    read -l -P "$prompt" confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function _ok_helper
  set -l last_nonempty_line
  while read line
    set line (string trim "$line")
    if test -n $line
      set last_nonempty_line $line
    end
  end
  echo $last_nonempty_line
end

function ok
  set -l last_nonempty_line (eval "$history[1] 2>&1 | _ok_helper")
	echo -ns (set_color --bold green) "Command to run: " (set_color normal)
  echo $last_nonempty_line
	if read_confirm_n (echo -ns (set_color --bold red) "Continue?")
		eval $last_nonempty_line
	end
end

# OCaml

if type "opam" > /dev/null 2> /dev/null
  openv
end

# Launch tmux on startup

if test \( -z "$in_tmux" \)
  tinit
end
