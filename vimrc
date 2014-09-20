set nocompatible
Plugin 'jiangmiao/auto-pairs'

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

" Searching
set hlsearch
set incsearch

" Miscellaneous Improvements
set number
set ruler
set cursorline
set wildmenu

" Hardmode Activated
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
