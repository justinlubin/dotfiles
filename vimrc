set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'chriskempson/base16-vim'

" Editor improvements
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/a.vim'

" Language support
Plug 'ElmCast/elm-vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'https://git.rhiannon.website/rhi/beluga.vim.git'
Plug 'purescript-contrib/purescript-vim'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Logger
let g:LanguageClient_serverCommands = {
    \ 'elm': ['~/Desktop/edit-mirror-client/edit-mirror'],
    \ }

" All
filetype plugin indent on
syntax enable

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal=0
autocmd Filetype markdown setlocal textwidth=80 wrap

" TeX
autocmd Filetype tex setlocal textwidth=80 wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72

" Elm
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0

" Twelf
autocmd BufNewFile,BufRead *.elf set syntax=beluga

" PureScript
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 256 colors
set t_Co=256

" Dark background
set background=dark

" Base 16 color scheme
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

highlight LineNr ctermbg=0
highlight SignColumn ctermbg=0

highlight GitGutterAdd ctermbg=0
highlight GitGutterChange ctermbg=0
highlight GitGutterDelete ctermbg=0
highlight GitGutterChangeDelete ctermbg=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor Behavior and Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs -> spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Indentation
set expandtab
set autoindent

" Column guide
set colorcolumn=80

" No line wrapping
set nowrap

" More information about file
set number
set ruler
set wildmenu

" No Folding
set nofoldenable

" Searching
set hlsearch
set incsearch

" Sign column
set signcolumn=yes

" Cursor lines
map <leader>- :set cursorcolumn!<Bar>set cursorline!<CR>

" Easier saving
command! W write

" For gitgutter
set updatetime=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better j/k navigation
nnoremap j gj
nnoremap k gk

" Mouse
set mouse=a

" Hardmode Activated
noremap <Right> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Behavior
set splitright
set splitbelow

" Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Vertical resize to show 80 (plus some padding)
nnoremap <leader>` :vertical resize 88<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CSS Vendor Prefixes
nnoremap <leader>p I-webkit-<ESC>yy4plciwmoz<ESC>jciwms<ESC>jciwo<ESC>jdiwxhx$
nnoremap <leader>o wbi-webkit-<ESC>yy4pf-lciwmoz<ESC>jciwms<ESC>jciwo<ESC>jdiwxhx$
