call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'voldikss/vim-floaterm'
Plug 'vim-test/vim-test'

Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'sheerun/vim-polyglot'
Plug 'zinit-zsh/zinit-vim-syntax'

Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'chriskempson/base16-vim'
Plug 'dawikur/base16-vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" General Settings
set hidden
set clipboard+=unnamed " TODO: Fix the clipboard
set expandtab
set nobackup
set noswapfile
set nowritebackup
set undodir=~/.vim/temp_dirs/undodir
set undofile
set updatetime=100
set shortmess+=c
set splitright
set splitbelow

" Space is our leader!
let g:mapleader="\<Space>"
nnoremap <silent> <Leader>ff :<C-u>CocCommand fzf-preview.ProjectFiles<CR>

" Line numbers
set signcolumn=yes
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Theme
set termguicolors
set cursorline
let base16colorspace = 256
let g:base16_shell_path = '~/.zinit/plugins/chriskempson---base16-shell/scripts/'
colorscheme base16-dracula

let g:airline_theme = 'base16_dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let &colorcolumn = '98,'.join(range(99,999),',')

let g:projectionist_heuristics = {}
let g:projectionist_heuristics['mix.exs'] = {
  \   'apps/*/mix.exs': { 'type': 'app' },
  \   'lib/*.ex': {
  \     'alternate': 'test/{}_test.exs',
  \     'type': 'lib',
  \     'template': [
  \       'defmodule {camelcase|capitalize|dot} do',
  \       'end'
  \     ]
  \   },
  \   'test/*_test.exs': {
  \     'alternate': 'lib/{}.ex',
  \     'type': 'test',
  \     'template': [
  \       'defmodule {camelcase|capitalize|dot}Test do',
  \       '  use ExUnit.Case',
  \       '',
  \       '  alias {camelcase|capitalize|dot}, as: Subject',
  \       '',
  \       '  doctest Subject',
  \       'end'
  \     ],
  \   },
  \   'config/*.exs': {
  \     'type': 'config'
  \   },
  \   'mix.exs': {
  \     'type': 'mix'
  \   }
  \ }

let g:dispatch_compilers = { 'elixir': 'exunit' }
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
