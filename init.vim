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
"
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

let g:loaded_netrw = 1
let g:dein#install_github_api_token = system('grep password ~/.netrc | cut -d\  -f2 | sed -z "s/\n//"')


if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein', [expand('<sfile>')])
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  
  " file manager
  " ------------
  call dein#add('Shougo/defx.nvim', {'rev': '1.5'})
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('kristijanhusak/defx-git')

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

" file manager
" ------------
let g:defx_icons_column_length = 2

let s:defx_default_options = '-columns=indent:git:icon:icons:filename'
let s:defx_default_vwidth = 30

function! s:DefxOpenFile(filename)
  if winlayout()[0] == 'leaf'
    let l:width = winwidth(1) - s:defx_default_vwidth
    execute 'vsplit' '+vertical\ resize\ ' . s:defx_default_vwidth
    execute 'wincmd' 'l'
    execute 'e' a:filename
  elseif len(winlayout()[1]) == 2
    execute 'wincmd l | rightbelow vsp' a:filename
  else
    execute 'e' a:filename
  endif
endfunction
command! -nargs=1 DefxOpenFile call s:DefxOpenFile(<q-args>)

function! s:DefxOpenDirectoryOnVimEnter()
  if argc() == 1 && isdirectory(argv()[0]) && !exists('s:defx_state_is_stdin')
    let l:cmd = join([s:defx_default_options,  argv()[0]], ' ')
    execute 'Defx' l:cmd
  endif
endfunction

function! s:DefxConfigure()
  nnoremap <silent><buffer><expr> <CR> 
        \ defx#is_directory()
        \ ? defx#do_action('open_tree', ['nested'])
        \ : defx#do_action('open', [':DefxOpenFile'])
  nnoremap <silent><buffer><expr> <2-LeftMouse> 
        \ defx#is_directory()
        \ ? defx#do_action('open_tree', ['nested'])
        \ : defx#do_action('open', [':DefxOpenFile'])

  nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')
endfunction

augroup defx-autocmd
  autocmd!
  autocmd FileType defx call s:DefxConfigure()
  autocmd StdinReadPre * let s:defx_state_is_stdin = 1
  autocmd VimEnter * call s:DefxOpenDirectoryOnVimEnter()
augroup END

