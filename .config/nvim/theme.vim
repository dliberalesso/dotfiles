set termguicolors
set cursorline
let base16colorspace = 256
let g:base16_shell_path = $ZDOTDIR . '/.zinit/plugins/chriskempson---base16-shell/scripts/'
colorscheme base16-dracula

let g:airline_theme = 'base16_dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1

let &colorcolumn = '98,'.join(range(99,999),',')

let g:fzf_preview_use_dev_icons = 1
