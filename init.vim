if &compatible
  set nocompatible
endif

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Editor
" ======
set number
set cursorline
set ambiwidth=double
set scl=yes

set directory=~/.cache/nvim/swap
set backupdir=~/.cache/nvim/backup

set clipboard=unnamed
set mouse=a

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

set backspace=indent,eol,start

filetype plugin indent on
syntax enable
colorscheme kalaclista

" Key bindings
" ============
vnoremap <silent>zs :sort<CR>
vnoremap <silent>zS :sort!<CR>

" File types
" ==========
augroup file-types
  autocmd BufRead,BufNewFile *.ps1 set ft=powershell
augroup END

" Plugins
" =======

" lazy loader
" ------------
function! s:lazy_load(pkg)
  exec "packadd! " . a:pkg
endfunction

" asyncomplete
" ------------
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:asyncomplete_auto_popup = 1

augroup init-autocomplete
  autocmd!

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['markdown'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor'),
    \ }))

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
    \ 'name': 'emmet',
    \ 'allowlist': ['html', 'xml'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#emmet#completor'),
    \ }))

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['markdown'],
    \ 'priority': 1,
    \ 'completor': function('asyncomplete#sources#omni#completor'),
    \ 'config': {
    \   'show_source_kind': 1,
    \ }
    \ }))

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
    \ 'name': 'tabnine',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['markdown'],
    \ 'priority': 5,
    \ 'completor': function('asyncomplete#sources#tabnine#completor'),
    \ 'config': {
    \   'line_limit': 1000,
    \   'max_num_result': 15,
    \  },
    \ }))

  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'rnix-lsp',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
    \ 'allowlist': ['nix'],
    \ })

augroup END

" file_manager
" ------------
function! s:init_fern()
  nmap <buffer><expr>
    \ <Plug>(fern-my-open-or-expand-or-collapse)
    \ fern#smart#leaf(
    \   "<Plug>(fern-action-open)",
    \   "<Plug>(fern-action-expand)",
    \   "<Plug>(fern-action-collapse)",
    \ )
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-or-expand-or-collapse)
  nmap <buffer> d <Plug>(fern-action-remove) 
endfunction

augroup init-fern
  autocmd!
  autocmd FileType fern call s:init_fern()
  autocmd FileType fern call glyph_palette#apply()
augroup END

function! s:open_fern(...)
  let dir = "."
  
  if a:0 == 1
    let dir = a:1 
  endif

  exec "Fern " . dir . " -drawer"
endfunction

command -nargs=? -complete=file Filetree call s:open_fern(<f-args>)

let g:fern#renderer = "nerdfont"

" commands
" --------
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

let g:openbrowser_default_search = 'duckduckgo'

augroup md-fix
  autocmd BufRead,BufNewFile *.md map! gx <Nop>
augroup END

if executable('win-browser')
  let g:openbrowser_browser_commands = [
        \ { 'name': 'win-browser', 'args': [ '{browser}', '{uri}' ] }
        \ ]
endif

augroup auto-format
  autocmd!
  "autocmd BufWritePre *.c undojoin | Neoformat
  "autocmd BufWritePre *.cc undojoin | Neoformat
  "autocmd BufWritePre *.cpp undojoin | Neoformat
  "autocmd BufWritePre *.h undojoin | Neoformat
  "autocmd BufWritePre *.hpp undojoin | Neoformat
  autocmd BufWritePre *.css undojoin | Neoformat
  autocmd BufWritePre *.go undojoin | Neoformat
  autocmd BufWritePre *.html undojoin | Neoformat
  autocmd BufWritePre *.js undojoin | Neoformat
  autocmd BufWritePre *.json undojoin | Neoformat
  autocmd BufWritePre *.nix undojoin | Neoformat
  autocmd BufWritePre *.pl undojoin | Neoformat
  autocmd BufWritePre *.pm undojoin | Neoformat
  autocmd BufWritePre *.scss undojoin | Neoformat
  autocmd BufWritePre *.t undojoin | Neoformat
  autocmd BufWritePre *.ts undojoin | Neoformat
  autocmd BufWritePre *.xml undojoin | Neoformat
  autocmd BufWritePre *.yaml undojoin | Neoformat
  autocmd BufWritePre cpanfile undojoin | Neoformat
augroup END

" golang
" ------
augroup init-golang
  autocmd!
  autocmd FileType go call s:lazy_load("go-import")
augroup END

" web
" ---
augroup init-web
  autocmd!
  autocmd FileType css call s:lazy_load("css")
  autocmd FileType markdown call s:lazy_load("markdown")
  autocmd FileType typescript call s:lazy_load("typescript")
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

" windows
" -------
if has('win32') || has('win64')
  packadd! cmdswitch

  if argc() == 0
    lcd ~/Downloads
  elseif argc() == 1
    exec "lcd " . fnamemodify(argv()[0], ':p:h') 
  endif
endif
