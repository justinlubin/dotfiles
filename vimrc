set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Color schemes
" Plug 'chriskempson/base16-vim'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'noahfrederick/vim-noctu'

" Editor improvements
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/a.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'

" Language support
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'dag/vim-fish'
Plug 'ocaml/vim-ocaml'
Plug 'souffle-lang/souffle.vim'
Plug 'andymass/vim-matlab'
Plug 'raivivek/nextflow-vim'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'puremourning/vimspector'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP and debugger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
  \ 'python': {
  \   'name': 'pylsp',
  \   'command': ['pylsp'],
  \   'initializationOptions': {
  \      'pylsp': {
  \        'configurationSources': ['flake8'],
  \        'plugins': {
  \          'pycodestyle': {
  \            'enabled': v:false
  \          },
  \          'mccabe': {
  \            'enabled': v:false
  \          },
  \          'pyflakes': {
  \            'enabled': v:false
  \          },
  \          'flake8': {
  \            'enabled': v:true
  \          }
  \        }
  \      }
  \   }
  \ },
  \ 'ocaml': ['ocamllsp'],
  \ 'elm': ['elm-language-server'],
  \ 'rust': ['rust-analyzer'],
  \ 'javascript': ['npx', '@biomejs/biome', 'lsp-proxy'],
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All
filetype plugin indent on
syntax enable

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal=0
autocmd Filetype markdown setlocal textwidth=80 wrap

" TeX
" autocmd Filetype tex setlocal textwidth=80 wrap
autocmd Filetype tex setlocal wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72

au BufRead,BufNewFile *.hblib set filetype=honeybee
au BufRead,BufNewFile *.hb set filetype=honeybee

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
colorscheme dim

highlight LineNr ctermbg=0
highlight SignColumn ctermbg=0
highlight GitGutterAdd ctermbg=0
highlight GitGutterChange ctermbg=0
highlight GitGutterDelete ctermbg=0
highlight GitGutterChangeDelete ctermbg=0
highlight ColorColumn ctermbg=8

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
map <leader>n :noh<CR>

" Sign column
set signcolumn=yes

" Cursor lines
map <leader>- :set cursorcolumn!<Bar>set cursorline!<CR>

" Easier saving
command! W write

" For gitgutter
set updatetime=100

" Allow backspacing
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better j/k navigation
nnoremap j gj
nnoremap k gk

" Mouse
set mouse=a

" Hardmode activated
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
:set fillchars+=vert:\ 

" Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Vertical resize to show 80 (plus some padding)
nnoremap <leader>` :vertical resize 88<CR>

" Make splits
nnoremap <leader>j :split<CR>
nnoremap <leader>k :vsplit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-slime
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
vnoremap . :SlimeSend<CR>
nmap <leader>s <Plug>SlimeSendCell

autocmd Filetype python let b:slime_cell_delimiter = "# %%"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufWrite *.ml :Autoformat
au BufWrite *.mli :Autoformat
au BufWrite *.py :Autoformat

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:formatdef_ocamlformat = '"ocamlformat --name " . expand("%:p") . " -"'
let g:formatters_ocaml = ['ocamlformat']

let g:formatters_python = ['black']

" let g:formatters_rust = ['rustfmt']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient-neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline

nnoremap <leader>q <Plug>(lcn-menu)
nnoremap <leader>w <Plug>(lcn-hover)
nnoremap <leader>d <Plug>(lcn-definition)
nnoremap <leader>r <Plug>(lcn-references)
" nnoremap <leader>r <Plug>(lcn-rename)
" nnoremap <leader>a <Plug>(lcn-format)

nnoremap <leader>t :cprev<CR>
nnoremap <leader>g :cnext<CR>

autocmd BufWritePre *.rs,*.js call LanguageClient#textDocument_formatting_sync()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader><Space> :Files<CR>
nnoremap <leader>f :Rg 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nnoremap <leader>d <Plug>VimspectorContinue
" nnoremap <leader>e :call vimspector#Reset()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree and Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:tagbar_position = 'topleft vertical'
let g:tagbar_position = 'rightbelow'
let g:tagbar_sort = 0
let g:tagbar_height = winheight(0) / 2
nnoremap <leader>m :NERDTreeToggle<CR>:TagbarToggle<CR>
