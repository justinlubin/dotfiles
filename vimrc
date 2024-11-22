set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'jeffkreeftmeijer/vim-dim'

" Editor improvements
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/a.vim'
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
Plug 'raivivek/nextflow-vim'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

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
" Base editor behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics
set backspace=indent,eol,start
set colorcolumn=80
set mouse=a
set nowrap
set number
set ruler
set signcolumn=yes
set updatetime=100 " For gitgutter
set wildmenu
set nofoldenable
nnoremap j gj
nnoremap k gk
command! W write

" Tabs and indentation
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Search
set hlsearch
set incsearch

" Splits
set splitright
set splitbelow
set fillchars+=vert:\ 
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal=0
autocmd Filetype markdown setlocal wrap

" TeX
autocmd Filetype tex setlocal wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72
autocmd Filetype gitcommit highlight ColorColumn ctermbg=1

" Honeybee
au BufRead,BufNewFile *.hblib set filetype=honeybee
au BufRead,BufNewFile *.hb set filetype=honeybee

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LanguageClient-neovim

let g:LanguageClient_serverCommands = {
  \ 'python': ["uvx", "ruff", "server"],
  \ 'ocaml': ['ocamllsp'],
  \ 'elm': ['elm-language-server'],
  \ 'rust': ['rust-analyzer'],
  \ 'javascript': ['npx', '@biomejs/biome', 'lsp-proxy'],
  \ }

hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline

autocmd BufWritePre
  \ *.py,*.rs,*.js
  \ call LanguageClient#textDocument_formatting_sync()

" vim-slime

let g:slime_target = "tmux"
" let g:slime_python_ipython = 1
let g:slime_bracketed_paste = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
autocmd Filetype python let b:slime_cell_delimiter = "# %%"
autocmd Filetype sh let b:slime_cell_delimiter = "# %%"

" NERDTree and Tagbar

let g:tagbar_position = 'rightbelow'
let g:tagbar_sort = 0
let g:tagbar_height = winheight(0) / 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>n :noh<CR>

nmap <leader>j :split<CR>
nmap <leader>k :vsplit<CR>
nmap <leader>` :vertical resize 88<CR>

nmap <leader>- :set cursorcolumn!<Bar>set cursorline!<CR>

nmap <leader><Space> :Files<CR>
nmap <leader>f :Rg 

nmap <leader>q <Plug>(lcn-menu)
nmap <leader>w <Plug>(lcn-hover)
nmap <leader>d <Plug>(lcn-definition)
nmap <leader>r <Plug>(lcn-references)

nmap <leader>t :cprev<CR>
nmap <leader>g :cnext<CR>

nmap <leader>s <Plug>SlimeSendCell

nmap <leader>m :NERDTreeToggle<CR>:TagbarToggle<CR>
