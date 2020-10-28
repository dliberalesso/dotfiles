nnoremap <silent> <leader> :<c-u>WhichKey 'SPC'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual 'SPC'<CR>

let g:which_key_map = {}
let g:which_key_sep = '->'

let g:which_key_map.b = {
  \ 'name' : '+buffer',
  \ '1' : ['<Plug>AirlineSelectTab1', 'buffer-1'],
  \ '2' : ['<Plug>AirlineSelectTab2', 'buffer-2'],
  \ '3' : ['<Plug>AirlineSelectTab3', 'buffer-3'],
  \ '4' : ['<Plug>AirlineSelectTab4', 'buffer-4'],
  \ '5' : ['<Plug>AirlineSelectTab5', 'buffer-5'],
  \ '6' : ['<Plug>AirlineSelectTab6', 'buffer-6'],
  \ '7' : ['<Plug>AirlineSelectTab7', 'buffer-7'],
  \ '8' : ['<Plug>AirlineSelectTab8', 'buffer-8'],
  \ '9' : ['<Plug>AirlineSelectTab9', 'buffer-9'],
  \ 'd' : [':bd', 'delete-buffer'],
  \ 'f' : [':bfirst', 'first-buffer'],
  \ 'l' : [':blast', 'last-buffer'],
  \ 'n' : [':bn', 'next-buffer'],
  \ 'p' : [':bp', 'previous-buffer'],
  \ 'b' : [':CocCommand fzf-preview.Buffers', 'fzf-buffers']
  \ } 

nnoremap <c-e> :e<Space>
nnoremap <c-h> :split<Space>
nnoremap <c-v> :vsplit<Space>

let g:which_key_map.f = {
  \ 'name' : '+find/file',
  \ 'd' : [':CocCommand fzf-preview.DirectoryFiles', 'fzf-directory-files'],
  \ 'e' : ['<c-e>', 'edit-file'],
  \ 'f' : [':CocCommand fzf-preview.ProjectFiles', 'fzf-project-files'],
  \ 'h' : ['<c-h>', 'split-edit-file'],
  \ 'm' : [':FloatermNew lf', 'lf-file-manager'],
  \ 's' : [':update', 'save-file'],
  \ 't' : [':CocCommand explorer --toggle', 'toggle-file-tree'],
  \ 'v' : ['<c-v>', 'vsplit-edit-file'],
  \ }

let g:which_key_map['q'] = {
  \ 'name' : '+quit/write',
  \ 'q' : [':q', 'quit'],
  \ 'Q' : [':qa!', 'quit-without-saving'],
  \ 'w' : [':w', 'write'],
  \ 'W' : [':wqa', 'write-all-and-quit'],
  \ }

autocmd! VimEnter * call which_key#register('SPC', 'g:which_key_map')
