nnoremap <silent> <leader> :<c-u>LeaderMapper 'SPC'<CR>
vnoremap <silent> <leader> :<c-u>LeaderMapper 'SPC'<CR>

let g:buffer_menu = {
  \ 'name' : '+buffer',
  \ '1' : ["normal \<Plug>AirlineSelectTab1", 'buffer-1'],
  \ '2' : ["normal \<Plug>AirlineSelectTab2", 'buffer-2'],
  \ '3' : ["normal \<Plug>AirlineSelectTab3", 'buffer-3'],
  \ '4' : ["normal \<Plug>AirlineSelectTab4", 'buffer-4'],
  \ '5' : ["normal \<Plug>AirlineSelectTab5", 'buffer-5'],
  \ '6' : ["normal \<Plug>AirlineSelectTab6", 'buffer-6'],
  \ '7' : ["normal \<Plug>AirlineSelectTab7", 'buffer-7'],
  \ '8' : ["normal \<Plug>AirlineSelectTab8", 'buffer-8'],
  \ '9' : ["normal \<Plug>AirlineSelectTab9", 'buffer-9'],
  \ 'd' : [':bd', 'delete-buffer'],
  \ 'f' : [':bfirst', 'first-buffer'],
  \ 'l' : [':blast', 'last-buffer'],
  \ 'n' : [':bn', 'next-buffer'],
  \ 'p' : [':bp', 'previous-buffer'],
  \ 'b' : [':CocCommand fzf-preview.Buffers', 'fzf-buffers']
  \ } 

let g:file_menu = {
  \ 'name' : '+find/file',
  \ 'd' : [':CocCommand fzf-preview.DirectoryFiles', 'fzf-directory-files'],
  \ 'e' : [':call feedkeys(":e ")', 'edit-file'],
  \ 'f' : [':CocCommand fzf-preview.ProjectFiles', 'fzf-project-files'],
  \ 'g' : [':CocCommand fzf-preview.GitFiles', 'fzf-git-files'],
  \ 'h' : [':call feedkeys(":split ")', 'split-edit-file'],
  \ 'm' : [':FloatermNew lf', 'lf-file-manager'],
  \ 's' : [':update', 'save-file'],
  \ 't' : [':CocCommand explorer --toggle', 'toggle-file-tree'],
  \ 'v' : [':call feedkeys(":vsplit ")', 'vsplit-edit-file'],
  \ }

let g:quit_menu = {
  \ 'name' : '+quit/write',
  \ 'q' : [':q', 'quit'],
  \ 'Q' : [':qa!', 'quit-without-saving'],
  \ 'w' : [':w', 'write'],
  \ 'W' : [':wqa', 'write-all-and-quit'],
  \ }

let g:leaderMenu = {
  \ 'name' : 'SPC',
  \ 'b' : [buffer_menu, '+buffer'],
  \ 'f' : [file_menu, '+find/file'],
  \ 'q' : [quit_menu, '+quit/write'],
  \ }
