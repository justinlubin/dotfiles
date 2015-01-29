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
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'

" HTML
Plugin 'othree/html5.vim'

" CSS
Plugin 'git://github.com/miripiruni/CSScomb-for-Vim.git'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Miscellaneous
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

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

" More information about file
set number
set ruler
set cursorline
set wildmenu

" Searching
set hlsearch
set incsearch
nnoremap <F8> :noh<CR>

" Buffer Navigation
set hidden
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <F4> :ls<CR>

" Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Better j/k navigation
nnoremap j gj
nnoremap k gk

" Save button
nnoremap <F5> :w<CR>

" Handy Autocomplete
" C-@ is C-Space in the terminal
inoremap <C-@> <C-P>

" Hardmode Activated
noremap <Right> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>
