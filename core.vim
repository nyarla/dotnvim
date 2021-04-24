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

" Hack for vim8
" -------------
if ! has('nvim')
  " https://qiita.com/kefir_/items/c725731d33de4d8fb096
  if has("vim_starting") && !has('gui_running') && has('vertsplit')
    function! EnableVsplitMode()
      let &t_CS = "y"
      let &t_ti = &t_ti . "\e[?6;69h"
      let &t_te = "\e[?6;69l\e[999H" . &t_te
      let &t_CV = "\e[%i%p1%d;%p2%ds"
      call writefile([ "\e[?6;69h" ], "/dev/tty", "a")
    endfunction

    map <special> <Esc>[3;9R <Nop>
    set t_F9=[3;3R
    map <expr> <t_F9> EnableVsplitMode()
    let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
  endif
endif
