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
  
  " file manager TODO: chage to defx and lightline
  " ------------
  call dein#add('preservim/nerdtree', {'rev': '6.9.11'})
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  call dein#add('vim-airline/vim-airline')

  " auto-complete
  " ------------- 
  call dein#add('Shougo/neco-syntax')
  call dein#add('mattn/emmet-vim') 
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/asyncomplete-file.vim')
  call dein#add('prabirshrestha/asyncomplete-emmet.vim')
  call dein#add('yami-beta/asyncomplete-omni.vim')
  call dein#add('prabirshrestha/asyncomplete-necosyntax.vim')
  if has('win32') || has('win64')
    call dein#add('kitagry/asyncomplete-tabnine.vim', { 'build': 'powershell.exe .\install.ps1'  })
  else
    call dein#add('kitagry/asyncomplete-tabnine.vim', { 'build': './install.sh'  })
  endif

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
let g:asyncomplete_auto_popup = 1

inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
  \ 'name': 'file',
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#file#completor'),
  \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
  \ 'name': 'emmet',
  \ 'allowlist': ['html', 'xml'],
  \ 'completor': function('asyncomplete#sources#emmet#completor'),
  \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
  \ 'name': 'omni',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#omni#completor'),
  \ 'config': {
  \   'show_source_kind': 1,
  \ }
  \ }))
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
  \ 'name': 'tabnine',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#tabnine#completor'),
  \ 'config': {
  \   'line_limit': 1000,
  \   'max_num_result': 15,
  \  },
  \ }))
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
  \ 'name': 'necosyntax',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
  \ }))

autocmd User lsp_setup call lsp#register_server({
  \ 'name': 'rnix-lsp',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
  \ 'allowlist': ['nix'],
  \ })


" auto-formatting
" ---------------

" JavaScript / TypeScript
autocmd BufWritePre *.ts undojoin | Neoformat
autocmd BufWritePre *.js undojoin | Neoformat

" CSS / SCSS
autocmd BufWritePre *.css undojoin | Neoformat
autocmd BufWritePre *.scss undojoin | Neoformat

" HTML / XML / Markdown
autocmd BufWritePre *.html undojoin | Neoformat
autocmd BufWritePre *.xml undojoin | Neoformat
autocmd BufWritePre *.md undojoin | Neoformat

" JSON / YAML
autocmd BufWritePre *.json undojoin | Neoformat
autocmd BufWritePre *.yaml undojoin | Neoformat
autocmd BufWritePre *.ts undojoin | Neoformat

" Nix
autocmd BufWritePre *.nix undojoin | Neoformat

" Perl
autocmd BufWrite *.pl undojoin | Neoformat
autocmd BufWrite *.pm undojoin | Neoformat
autocmd BufWrite cpanfile undojoin | Neoformat

" C / C++
autocmd BufWritePre *.c undojoin | Neoformat
autocmd BufWritePre *.h undojoin | Neoformat
"autocmd BufWritePre *.cpp undojoin | Neoformat
"autocmd BufWritePre *.hpp undojoin | Neoformat
autocmd BufWritePre *.cc undojoin | Neoformat

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

let g:airline_powerline_fonts = 1
