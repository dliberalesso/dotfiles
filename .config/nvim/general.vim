set hidden
set clipboard+=unnamedplus
set expandtab
set nobackup
set noswapfile
set nowritebackup
set undodir=~/.local/share/nvim/undodir
set undofile
set updatetime=100
set shortmess+=c
set splitright
set splitbelow

set signcolumn=yes
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
