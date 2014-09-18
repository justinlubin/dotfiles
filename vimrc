set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'tomasr/molokai'

Plugin 'scrooloose/nerdtree'

Plugin 'https://github.com/guns/vim-clojure-static'
Plugin 'https://github.com/tpope/vim-fireplace'
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

Plugin 'jiangmiao/auto-pairs'

call vundle#end()

filetype plugin indent on

colorscheme molokai

" let g:solarized_termcolors = 256
" colorscheme solarized
" set background=dark

set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab
set autoindent
set cindent

syntax enable

set number
set ruler

set cursorline

set hlsearch
set incsearch

" Hardmode Activated
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
