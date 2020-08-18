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
set nowrap 
" search settings
set incsearch
set smartcase
set ignorecase
set incsearch
" file track
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors " required for applying themes
set scrolloff=8
set colorcolumn=80 
set ma
set cursorline

" ###########################################################
" PLUG PACKAGE MANAGER
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'morhetz/gruvbox'
Plug 'hzchirs/vim-material' "material theme
Plug 'pangloss/vim-javascript'
Plug 'mbbill/undotree'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install'}
Plug 'prettier/vim-prettier', {'do' : 'npm install'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vifm/vifm.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" ###########################################################
" STATUSLINE
function! StatuslineGit()
  let l:branchname = gitbranch#name()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#

set statusline+=%#CursorLineNr#
set statusline+=%{StatuslineGit()}
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %r
set statusline+=\ %M

set statusline+=%= " adds to right side
set statusline+=\ %y
set statusline+=\  
set statusline+=%#LineNr#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\  
set statusline+=%#PmenuSel#
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
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_snippets_next = '<tab>'

" ###########################################################
" REACT EMMET AUTOCOMPLETE

let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ###########################################################
" LEADER BINDINGS

let mapleader = " "

" Vertical resizings
nnoremap <Leader>q :vertical resize +5<CR>
nnoremap <Leader>e :vertical resize -5<CR>

" netrw 
nnoremap <Leader>t :Lexplore<CR>

" Vifm
nnoremap <Leader>f :Vifm .<CR>

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
let g:coc_disable_startup_warning = 1
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" ###########################################################
" VIM THEME SETTINGS

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme vim-material

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

