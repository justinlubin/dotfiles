set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'jeffkreeftmeijer/vim-dim'

" Editing improvements
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'

" Editor improvements
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/a.vim'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'

" Language support
Plug 'dag/vim-fish'
Plug 'ocaml/vim-ocaml'
Plug 'raivivek/nextflow-vim'
Plug 'eigenfoo/stan-vim'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

call plug#end()

" Make the `filetype plugin indent on` setting from vim-plug explicit
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:tweak_colors()
    highlight LineNr ctermbg=0
    highlight SignColumn ctermbg=0
    highlight GitGutterAdd ctermbg=0
    highlight GitGutterChange ctermbg=0
    highlight GitGutterDelete ctermbg=0
    highlight GitGutterChangeDelete ctermbg=0
    highlight ColorColumn ctermbg=8
endfunction

syntax enable
set background=dark
autocmd! ColorScheme dim call s:tweak_colors()
colorscheme dim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base editor behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics
set backspace=indent,eol,start
" set textwidth=80
set textwidth=0
set colorcolumn=80
set mouse=a
set nowrap
set number
set ruler
set signcolumn=yes
set updatetime=100 " For gitgutter
set wildmenu
set nofoldenable
set display=lastline
set linebreak
nnoremap j gj
nnoremap k gk
command! W write

" Tabs and indentation
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

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

" Move lines
nnoremap <C-S-J> :move +1<CR>
nnoremap <C-S-K> :move -2<CR>
vnoremap <C-S-J> :move '>+1<CR>gv=gv
vnoremap <C-S-K> :move '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Markdown
autocmd Filetype markdown setlocal wrap

" TeX
autocmd Filetype tex setlocal wrap

" Git
autocmd Filetype gitcommit set colorcolumn=72
autocmd Filetype gitcommit highlight ColorColumn ctermbg=1

" Rust
let g:rust_recommended_style = v:false " from the vim ftplugin

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
  \ 'css': ['npx', '@biomejs/biome', 'lsp-proxy'],
  \ 'gleam': ['gleam', 'lsp'],
  \ }

let g:LanguageClient_rootMarkers = ['biome.json']

hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline

autocmd BufWritePre
  \ *.py,*.rs,*.js,*.elm,*.gleam",*.css
  \ call LanguageClient#textDocument_formatting_sync()

autocmd BufWritePre
  \ *.py
  \ call LanguageClient#executeCodeAction('source.organizeImports.ruff')

" vim-slime

let g:slime_target = "tmux"
let g:slime_bracketed_paste = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
autocmd Filetype python let b:slime_cell_delimiter = "# %%"
autocmd Filetype sh let b:slime_cell_delimiter = "# %%"
autocmd Filetype r let b:slime_cell_delimiter = "# %%"

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

" TODOs

autocmd! Filetype elm imap <leader>` Debug.todo "TODO"
autocmd! Filetype rust imap <leader>` todo!()

" Prose

nmap <leader>0 :w !wc -w<CR>

" Notes

nmap <leader>b :!bu<CR>

function! Due()
    call inputsave()
    let due = input('due:')
    execute 'r!python3 ~/dotfiles/date.py ' . due
    call inputrestore()
endfunction

nmap <leader>d k:call Due()<CR>Idue:<ESC>J
nmap <leader>e O# <ESC>:r!date +"\%Y-\%m-\%d"<CR>kJo<CR><CR><ESC>ki
nmap <leader>x k:r!date +"\%Y-\%m-\%d"<CR>Idone:<ESC>JddGp''zz
vmap <leader>r :%!sort -n<CR>
nmap <leader>z /^#<CR>
