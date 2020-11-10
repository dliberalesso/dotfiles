function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-projectionist')
  call packager#add('tpope/vim-sensible')
  call packager#add('tpope/vim-surround')

  call packager#add('dpretet/vim-leader-mapper')
  call packager#add('junegunn/fzf', { 'do': { -> fzf#install() } })
  call packager#add('nvim-treesitter/nvim-treesitter')
  call packager#add('neoclide/coc.nvim', { 'branch': 'release' })

  call packager#add('voldikss/vim-floaterm')
  call packager#add('vim-test/vim-test')

  call packager#add('sheerun/vim-polyglot')
  call packager#add('kana/vim-textobj-user')
  " call packager#add('zinit-zsh/zinit-vim-syntax', { 'type': 'opt' })
  call packager#add('zinit-zsh/zinit-vim-syntax')
  " call packager#add('andyl/vim-textobj-elixir', { 'type': 'opt' })
  call packager#add('andyl/vim-textobj-elixir')

  call packager#add('bling/vim-airline')
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('mhinz/vim-signify')

  " call packager#add('norcalli/nvim-colorizer.lua', { 'type': 'opt' })
  call packager#add('norcalli/nvim-colorizer.lua')
  " call packager#add('chriskempson/base16-vim', { 'type': 'opt' })
  call packager#add('chriskempson/base16-vim')
  " call packager#add('dawikur/base16-vim-airline-themes', { 'type': 'opt' })
  call packager#add('dawikur/base16-vim-airline-themes')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! UpdatePackages call PackagerInit() | call packager#update({ 'force_hooks': 1, 'on_finish': 'quitall' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
