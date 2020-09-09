" Core
" ====

" Editor
" ------
if &compatible
  set nocompatible
endif

syntax on
filetype on
filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set backspace=indent,eol,start
set clipboard=unnamed

" Interface
" ---------

set number
set laststatus=2
set showtabline=0
set ambiwidth=double

set completeopt-=preview

" Files
" -----
set directory=~/.cache/nvim/swap
set backupdir=~/.cache/nvim/backup

" Device
" ------
set mouse=a

" Plugins
" =======

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " auto-complete
  " -------------
  let g:deoplete#enable_at_startup=1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  let g:lsp_textprop_enabled = 1
  
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
  call dein#add('lighttiger2505/deoplete-vim-lsp')

  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'rnix-lsp',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
    \ 'whitelist': ['nix'],
    \ })

  " file
  " ----
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('mattn/vim-goimports')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('delphinus/vim-firestore')
  call dein#add('LnL7/vim-nix')

  call dein#add('sbdchd/neoformat')

  " interface
  " ---------
  call dein#add('dim13/smyck.vim')

  " dein
  " ----
  
  let g:dein#auto_recache = 1

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme smyck
