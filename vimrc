set nocompatible

" Required for Vundle (reset later)
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle-ception
Plugin 'gmarik/Vundle.vim'

" Color Schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'tomasr/molokai'

" File Management
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'

" Clojure
Plugin 'https://github.com/guns/vim-clojure-static'
Plugin 'https://github.com/tpope/vim-fireplace'
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

call vundle#end()
filetype plugin indent on
syntax enable

" Current Color Scheme
colorscheme molokai

" let g:solarized_termcolors = 256
" colorscheme solarized
" set background=dark

" Tabs -> Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Indentation
set expandtab
set autoindent
set cindent

" More information about file
set number
set ruler
set cursorline
set wildmenu

" Searching
set hlsearch
set incsearch

" Hardmode Activated
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
