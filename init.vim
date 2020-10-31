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
set scl=yes

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
"
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_github_api_token = system('grep password ~/.netrc | cut -d\  -f2 | sed -z "s/\n//"')


if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein', [expand('<sfile>')])
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  
  " file manager
  " ------------
  call dein#add('preservim/nerdtree', {'rev': '6.9.9'})
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  call dein#add('vim-airline/vim-airline')
  call dein#add('liuchengxu/vista.vim')

  " auto-complete
  " ------------- 
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('lighttiger2505/deoplete-vim-lsp')
  call dein#add('hrsh7th/deoplete-fname')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })

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
  call dein#end()
  call dein#save_state()
endif

" Plugin Configuration
" ====================

" post configure
" --------------
filetype plugin indent on
syntax enable
colorscheme smyck

" auto-complete
" -------------
let g:deoplete#enable_at_startup=1 

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<Tab>"

augroup lsp-register
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'rnix-lsp',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
    \ 'whitelist': ['nix'],
    \ })
augroup END

" auto-formatting
" ---------------
augroup neoformat
  autocmd!
  autocmd BufWritePre *.ts,*.js,*.md,*.yaml,*.json,*.css,*.scss undojoin | Neoformat
augroup END

" file manager
" ------------
let g:NERDTreeGitStatusUseNerdFonts = 1
function! s:openNERDTree()
  if argc() == 1 && isdirectory(argv()[0]) && exists('s:is_stdin')
    exec 'NERDTree' argv()[0]
  endif
endfunction

augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:is_stdin = 1
  autocmd VimEnter * call s:openNERDTree()
augroup END

let g:vista_update_on_text_changed = 1
let g:vista_default_executive = "vim_lsp"
let g:vista#renderer#enable_icon = 1

let g:airline_powerline_fonts = 1
