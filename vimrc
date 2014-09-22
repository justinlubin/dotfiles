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
Plugin 'chriskempson/vim-tomorrow-theme' 
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'

" Editor Improvements
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

" Miscellaneous
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on
syntax enable

" 256 Color
set t_Co=256

" Dark Background
set background=dark

" Current Color Scheme
colorscheme Tomorrow-Night

let g:solarized_termcolors = 256
" colorscheme solarized

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

" Tab Autocomplete
imap <Tab> <C-N>

" Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Hardmode Activated
noremap <Right> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>
