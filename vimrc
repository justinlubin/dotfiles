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
Plugin 'chriskempson/base16-vim'
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'

" Editor Improvements
Plugin 'vim-scripts/a.vim'

" HTML
Plugin 'othree/html5.vim'

" CSS
Plugin 'miripiruni/CSScomb-for-Vim'

" TypeScript
Plugin 'leafgarland/typescript-vim'

" Dart
Plugin 'dart-lang/dart-vim-plugin'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Haskell
Plugin 'neovimhaskell/haskell-vim'

" Elm
Plugin 'ElmCast/elm-vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" tmux
Plugin 'christoomey/vim-tmux-navigator'

" Snippets
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" Miscellaneous
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()

filetype plugin indent on
syntax enable

" 256 Color
set t_Co=256

" Dark Background
set background=dark

" Base 16 Shell
let base16colorspace=256

" Current Color Scheme
colorscheme base16-ocean

" Transparent Background
hi Normal ctermbg=none

" Solarized Color Scheme Configuration
let g:solarized_termcolor=256

" Tabs -> Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Indentation
set expandtab
set autoindent
" Align to ( in function call
set cino+=(0

" Column Guide
set colorcolumn=80

" No line wrapping
set nowrap

" More information about file
set number
set ruler
set wildmenu

" No Folding
set nofoldenable

" Snippet Configuration
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Paste Toggle
nnoremap <F6> :set paste<CR>
nnoremap <F7> :set nopaste<CR>

" Searching
set hlsearch
set incsearch
nnoremap <F8> :noh<CR>
nnoremap <leader>8 :noh<CR>

" Split Navigation
set splitright
set splitbelow

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <F11> :split 
nnoremap <leader>9 :split 

nnoremap <F12> :vsplit 
nnoremap <leader>0 :vsplit 

" Better j/k navigation
nnoremap j gj
nnoremap k gk

" Save button
nnoremap <F5> :w<CR>

" Handy Autocomplete
" C-@ is C-Space in the terminal
inoremap <C-@> <C-P>

" Auto-close HTML tags
iabbrev </ </<C-X><C-O>

" Hardmode Activated
noremap <Right> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>

" CSS Vendor Prefixes
nnoremap <leader>p I-webkit-<ESC>yy4plciwmoz<ESC>jciwms<ESC>jciwo<ESC>jdiwxhx$
nnoremap <leader>o wbi-webkit-<ESC>yy4pf-lciwmoz<ESC>jciwms<ESC>jciwo<ESC>jdiwxhx$

" Markdown Configuration
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
autocmd Filetype markdown setlocal textwidth=80 wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72

" Hardcopy
nnoremap <leader>= :call HardcopyToPS()<CR>
function HardcopyToPS()
    let psName = expand("%:r") . ".ps"
    let outputCommand = "hardcopy > " . psName
    exec outputCommand
endfunction

" Haskell
let g:haskell_indent_case = 4
let g:haskell_indent_guard = 4

" Elm
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0
