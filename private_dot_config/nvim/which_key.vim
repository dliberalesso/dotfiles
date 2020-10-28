nnoremap <silent> <leader> :<c-u>WhichKey 'spc'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual 'spc'<CR>

let g:which_key_map = {}
let g:which_key_sep = '->'

let g:which_key_map.f = {
  \ 'name' : '+find/files',
  \ 'd' : [':silent :CocCommand fzf-preview.DirectoryFiles', 'fzf-directory-files'],
  \ 'e' : [':silent :FloatermNew lf', 'lf-file-manager'],
  \ 'f' : [':silent :CocCommand fzf-preview.ProjectFiles', 'fzf-project-files'],
  \ }

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

autocmd! VimEnter * call which_key#register('spc', 'g:which_key_map')
