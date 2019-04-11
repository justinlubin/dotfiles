set nocompatible

call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

" Editor Improvements
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" C
Plug 'vim-scripts/a.vim'

" HTML
Plug 'othree/html5.vim'

" CSS
Plug 'miripiruni/CSScomb-for-Vim'

" TypeScript
Plug 'leafgarland/typescript-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Elm
Plug 'ElmCast/elm-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Wyvern
Plug 'hcnelson99/wyvern.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" JSON
Plug 'elzr/vim-json'

call plug#end()

filetype plugin indent on
syntax enable

" 256 Color
set t_Co=256

" Dark Background
set background=dark

" Base 16 Color Scheme
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

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

" Auto-close HTML tags
iabbrev </ </<C-X><C-O>

" Mouse
set mouse=a

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
let g:vim_markdown_conceal=0
autocmd Filetype markdown setlocal textwidth=80 wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72

" Elm
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0

" Indent Line
let g:indentLine_char = '│'

" Git Gutter
set updatetime=100

" Fuzzy finder
nnoremap <leader>[ :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'btab': 'split',
  \ 'tab': 'vsplit' }

" No JSON concealing
let g:vim_json_syntax_conceal = 0
