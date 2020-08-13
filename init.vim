syntax on

set noerrorbells
" tab settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" side numbers
set nu
set relativenumber
set wrap 
" search settings
set incsearch
set smartcase
set ignorecase
set incsearch
" file track
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors " required for applying themes
set scrolloff=8
set colorcolumn=80 
set ma


" ###########################################################
" PLUG PACKAGE MANAGER
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'hzchirs/vim-material' "material theme
Plug 'pangloss/vim-javascript'
Plug 'mbbill/undotree'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install'}
Plug 'prettier/vim-prettier', {'do' : 'npm install'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vifm/vifm.vim'
call plug#end()

" ###########################################################
" STATUSLINE
set statusline=
set statusline+=%#PmenuSel#

set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %f

set statusline+=%= " adds to right side
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]

" ###########################################################
" COC CONFIGURATION
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-pairs',
  \ ]

" use TAB to trigger completition
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippets_next = '<tab>'

" ###########################################################
" LEADER BINDINGS

let mapleader = " "

" Vertical resizings
nnoremap <Leader>q :vertical resize +5<CR>
nnoremap <Leader>f :vertical resize -5<CR>

" netrw 
nnoremap <Leader>t :Lexplore<CR>

" basic mappings
nnoremap <Leader>s :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>so :source %<CR>
nnoremap <Leader>u :UndotreeToggle<CR>
" split screen momvements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ###########################################################
" MISC SETTINGS
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:coc_disable_startup_warning = 1

" ###########################################################
" VIM THEME SETTINGS

set background=dark
colorscheme vim-material

" ###########################################################
" PRETTIER CODE FORMATER
let g:prettier#autoformat_require_pragma = 0

" ###########################################################
" NETRW CONFIGURATION

" absolute width of netrw window
let g:netrw_winsize = -30

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

" ###########################################################
" VIM JAVASCRIPT CONFIGURATION

" enable syntax highlight for jsdocs
let g:javascript_plugin_jsdoc = 1

