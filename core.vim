" Core
" ====

" Editor
" ------
if &compatible
  set nocompatible
endif

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set backspace=indent,eol,start
set clipboard=unnamed

filetype plugin indent on
syntax enable

" Interface
" ---------
set number
set laststatus=2
set showtabline=2
set ambiwidth=double
set scl=yes

set completeopt-=preview
set termguicolors

" Files
" -----
set directory=~/.cache/nvim/swap
set backupdir=~/.cache/nvim/backup

" Device
" ------
set mouse=a
