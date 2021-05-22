" Core
" ====

" Editor
" ------
if &compatible
  set nocompatible
endif

set mouse=a

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

if ! has('gui_running')
  set termguicolors
endif

" Files
" -----
if has('win32') || has('win64')
  set directory=C:/Users/nyarla/AppData/Local/Temp/nvim/swap
  set backupdir=C:/Users/nyarla/AppData/Local/Temp/nvim/backup
else
  set directory=~/.cache/nvim/swap
  set backupdir=~/.cache/nvim/backup
endif

autocmd BufRead,BufNewFile *.ps1 set ft=ps1
