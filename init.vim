" Global
" ======
if &compatible
  set nocompatible
endif

let s:isWindows = has('win32') || has('win64')

" Script
" ======
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Shell
" =====
if s:isWindows
  set shell=pwsh.exe
  set shellquote= shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
endif

" Plugins
" =======
let s:deinState = 0
if s:isWindows
  set runtimepath+=~/AppData/Local/dein/repos/github.com/Shougo/dein.vim
  let s:deinState=dein#load_state('~/AppData/Local/dein')
else
  set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
  let g:dein#install_github_api_token=trim(system('grep password ~/.netrc | cut -d\  -f1'))
  let s:deinState=dein#load_state('~/.local/share/dein')
endif

if s:deinState
  " Plugin Manager
  if s:isWindows
    call dein#begin('~/AppData/Local/dein', [expand('<sfile>')])
    call dein#add('~/AppData/Local/dein/repos/github.com/Shougo/dein.vim')
  else
    call dein#begin('~/.local/share/dein', [expand('<sfile>')])
    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  endif

  call dein#add('wsdjeg/dein-ui.vim')

  " File Manager
  call dein#add('preservim/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  " Status or Tab line
  call dein#add('itchyny/lightline.vim')


  " Auto-complete
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
 
  " Syntax files
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('mattn/vim-goimports')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('delphinus/vim-firestore')
  call dein#add('LnL7/vim-nix')
  call dein#add('nyarla/vim-syntax-spvm')
  call dein#add('plasticboy/vim-markdown')

  " Auto-format
  call dein#add('sbdchd/neoformat')
  
  " END
  call dein#end()
  call dein#save_state()
endif


" Functions
" =========
function! GetISODate()
  if s:isWindows
    return trim(system("coreutils.exe date +%Y-%m-%d"))
  else
    return trim(system("date +%Y-%m-%d"))
  end
endfunction

function! GetISODateTime()
  if s:isWindows
    return trim(system("coreutils.exe date +%Y-%m-%dT%H:%M:%S+09:00"))
  else
    return trim(system("date +%Y-%m-%dT%H:%M:%S+09:00"))
  end
endfunction

function! GetWeekDay()
  if s:isWindows
    return trim(system("coreutils.exe date +%a"))
  else
    return trim(system("date +%a"))
  end
endfunction

function! GetHostname()
  if s:isWindows
    return trim(system("coreutils.exe hostname"))
  else
    return trim(system("hostname"))
  end
endfunction

function! GetName()
  if has('win32') || has('win64')
    return trim(system("coreutils.exe whoami"))
  else
    return trim(system("whoami"))
  endif
endfunction

" GUI
" ===

" editor
" ------
set number
set ambiwidth=double
set scl=yes

" guifont
" -------
if exists("g:nvy") && g:nvy == 1
  set guifont=MyricaM\ M:h14
endif

" colorscheme
" -----------
colorscheme base16-kalaclista
syntax on

if ! has('gui_running')
  set termguicolors
endif

" tabline / status line
" ---------------------
set laststatus=2
set showtabline=2

let s:lightlineIconSymbols = {
  \ 'calendar': "\uf455",
  \ 'close':    "\uf56d",
  \ 'host':     "\uf473",
  \ 'new':      "\uf055",
  \ 'readonly': "\uf023",
  \ 'uname':    "\uf2be",
  \ 
  \ 'nerdtree': "\uf414",
  \
  \ 'normal':   "\uf24a",
  \ 'insert':   "\uf8e9",
  \ 'replace':  "\uf1b8",
  \ 'visual':   "\uf1fb",
  \ 'v-line':   "\uf039",
  \ 'v-block':  "\uf125",
  \ 'command':  "\ue7a2",
  \ 'select':   "\uf1b8",
  \ 's-line':   "\uf039",
  \ 's-block':  "\uf125",
  \ 'terminal': "\uf489",
  \ }

let s:lightlineIconColors = {
  \ 'c': ['#0099FF', '#000000', 'blue', 'black'],
  \ 'cc': ['#0099FF', '#000000', 'blue', 'black'],
  \ 'cpp': ['#0099FF', '#000000', 'blue', 'black'],
  \ 'go': [ '#0099FF', '#000000', 'blue', 'black' ],
  \ 'h': ['#FF3300', '#000000', 'red', 'black'],
  \ 'hh': ['#FF3300', '#000000', 'red', 'black'],
  \ 'hpp': ['#FF3300', '#000000', 'red', 'black'],
  \ 'spvm': [ '0099FF', '#000000', 'blue', 'black' ],
  \ 'vim': [ '#CCFF00', '#000000', 'green', 'black' ],
  \ }

let s:colorscheme = '16color'
let s:p = g:lightline#colorscheme#{s:colorscheme}#palette

let s:p.tabline.left = [
      \   [ '#FFFFFF', '#000000', 'white', 'black' ],
      \ ]
let s:p.tabline.right = copy(s:p.tabline.left)

let s:p.tabline.tabsel = [
      \   [ '#000000', '#00CCFF', 'black', 'blue' ],
      \ ]

let s:p.normal.left[0]    = ['#000000', '#00CCFF', 'black', 'blue']
let s:p.inactive.left[0]  = ['#000000', '#666666', 'black', 'gray']
let s:p.insert.left[0]    = ['#000000', '#99CC00', 'black', 'green']
let s:p.replace.left[0]   = ['#000000', '#FF6633', 'black', 'red']
let s:p.visual.left[0]    = ['#000000', '#00CCCC', 'black', 'cyan']

let s:p.normal.left[1]    = ['#FFFFFF', '#000000', 'white', 'black']
let s:p.inactive.left[1]  = ['#666666', '#000000', 'gray',  'black']
let s:p.insert.left[1]    = ['#FFFFFF', '#000000', 'white', 'black']
let s:p.replace.left[1]   = ['#FFFFFF', '#000000', 'white', 'black']
let s:p.visual.left[1]    = ['#FFFFFF', '#000000', 'white', 'black']

hi TablineLabel ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000
hi TablineIconCal ctermfg=Yellow ctermbg=Black guifg=#FFCC33 guibg=#000000
hi TablineIconClose ctermfg=Red ctermbg=Black guifg=#FF6633 guibg=#000000
hi TablineIconHost ctermfg=Green ctermbg=Black guifg=#CCFF00 guibg=#000000
hi TablineIconNew ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000
hi TablineIconName ctermfg=Blue ctermbg=Black guifg=#00CCFF guibg=#000000

hi LightlineLabel ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000
hi LightlineBufIcon ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000

function! LightlineGetBufferName(name)
  if a:name =~ 'NERD_tree'
    return 'NERDTree'
  endif

  if a:name != ''
    return a:name
  endif

  return '(new)'
endfunction

function! LightlineGetBufferExpandedName()
  let name = expand('%:t') 
  let label = LightlineGetBufferName(name)

  if label !=# 'NERDTree'
    return name
  endif

  return ''
endfunction

function! LightlineGetIconSymbol(name)
  if a:name !=# ''
    return get(s:lightlineIconSymbols, a:name, '')
  endif

  if &filetype !=# ''
    let ft = &filetype

    if ft ==# 'nerdtree'
      return get(s:lightlineIconSymbols, a:name, '')
    endif

    let icon = WebDevIconsGetFileTypeSymbol()
    let color = get(s:lightlineIconColors, ft, ['#FFFFFF', '#000000', 'white', 'black'])

    if icon !=# ''
      exec printf("hi LightlineColorIcon guifg=%s guibg=%s ctermfg=%s ctermbg=%s",
            \ color[0], color[1], color[2], color[3] )
      return icon
    endif
  endif

  return ''
endfunction

function! LightlineNewTab(idx, count, button, modifier)
  if a:count == 1 && a:button == "l"
    tabnew
  endif
endfunction

function! LightlineGetBufferState()
  let name = expand('%:t')
  let label = LightlineGetBufferName(name)

  if label ==# "NERDTree"
    return LightlineGetIconSymbol('nerdtree') . ' ' . label . ''
  endif

  return lightline#mode()
endfunction

function! LightlineGetTabName(n)
  let list = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = expand('#'. list[winnr - 1] . ':t')

  if name =~ 'todo\.md'
    return g:lightlineStaticInfo.date_weekday
  endif
 
  return LightlineGetBufferName(name)
endfunction

function! LightlineGetTabState(n)
  let list = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = expand('#', list[winnr -1] . ':t')

  if name ==# 'NERD_tree'
    return LightlineGetIconSymbol(name)
  endif

  if name =~ 'todo\.md$'
    return LightlineGetIconSymbol('calendar')
  endif

  if gettabwinvar(a:n, winnr, '&readonly')
    return LightlineGetIconSymbol('readonly')
  endif
endfunction

let s:lightlineSep = {'left': '', 'right': ''}
let s:lightlineModeMap = {
  \ 'n'       : LightlineGetIconSymbol('normal')   . ' NORMAL',
  \ 'i'       : LightlineGetIconSymbol('insert')   . ' INSERT',
  \ 'R'       : LightlineGetIconSymbol('replace')  . ' REPLACE',
  \ 'v'       : LightlineGetIconSymbol('visual')   . ' VISUAL',
  \ 'V'       : LightlineGetIconSymbol('v-line')   . ' V-LINE',
  \ '\<C-v>'  : LightlineGetIconSymbol('v-block')  . ' V-BLOCK',
  \ 'c'       : LightlineGetIconSymbol('command')  . ' COMMAND',
  \ 's'       : LightlineGetIconSymbol('select')   . ' SELECT',
  \ 'S'       : LightlineGetIconSymbol('s-line')   . ' S-LINE',
  \ '\<C-s>'  : LightlineGetIconSymbol('s-block')  . ' S-BLOCK',
  \ 't'       : LightlineGetIconSymbol('terminal') . ' TERMINAL',
  \ }

let g:lightlineStaticInfo = {
  \ 'date': GetISODate(),
  \ 'date_weekday': GetISODate() . ' (' . GetWeekDay() . ')',
  \ 'hostname': GetHostname(),
  \ 'name': GetName(),
  \ }

let g:lightline = {
  \ 'colorscheme': s:colorscheme,
  \
  \ 'component': {
  \   'date':  "%#TablineIconCal#%{LightlineGetIconSymbol('calendar')} %#TablineLabel#%{g:lightlineStaticInfo.date}",
  \   'hostname': "%#TablineIconHost#%{LightlineGetIconSymbol('host')} %#TablineLabel#%{g:lightlineStaticInfo.hostname}",
  \   'name': "%#TablineIconName#%{LightlineGetIconSymbol('uname')} %#TablineLabel#%{g:lightlineStaticInfo.name}",
  \   'close': "%#TablineIconClose#%999X%{LightlineGetIconSymbol('close')} ",
  \   'open': "%#TablineIconNew#%@LightlineNewTab@%{LightlineGetIconSymbol('new')}%T",
  \   'state': "%{LightlineGetBufferState()}",
  \   'filename':"%#LightlineBufIcon#%{LightlineGetIconSymbol('')} %{LightlineGetBufferExpandedName()}",
  \ },
  \ 'tab_component_function': {
  \   'tabState': 'LightlineGetTabState',
  \   'tabName': 'LightlineGetTabName',
  \ },
  \
  \ 'tabline': {
  \   'left': [[ 'open', 'tabs' ]],
  \   'right': [['close', 'date', 'name','hostname']],
  \ },
  \ 'tab': {
  \   'active': [ 'tabSate', 'tabName' ],
  \   'inactive': [ 'tabState', 'tabName' ],
  \ },
  \
  \ 'active': {
  \   'left': [ ['state'], ['filename'] ],
  \   'right': [  ],
  \ },
  \ 'inactive': {
  \   'left': [ ['state'], ['filename'] ],
  \   'right': [  ],
  \ },
  \
  \ 'mode_map': s:lightlineModeMap,
  \
  \ 'separator': copy(s:lightlineSep),
  \ 'subseparator': copy(s:lightlineSep),
  \ 'tabline_separator': copy(s:lightlineSep),
  \ }

" Editor
" ======

" clipboard
" ---------
set clipboard=unnamed

" mouse
" -----
set mouse=a

" tab
" ---
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" keybind
" -------
set backspace=indent,eol,start

" auto-complete
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" tmux-like
if has('nvim')
  augroup neovim-terminal
    autocmd TermOpen * startinsert
    autocmd TermEnter * set nonumber
    autocmd TermLeave * set number
  augroup END

  tnoremap <silent><C-t>q <C-\><C-n>:exit<CR>
  tnoremap <silent><C-t>x <C-\><C-n>

  nnoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal<CR>
  inoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal<CR>
  tnoremap <silent><C-t>c <C-\><C-n>:tabnew<CR>:terminal<CR>

  nnoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal<CR>
  inoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal<CR>
  tnoremap <silent><C-t>\| <C-\><C-n>:botright vsplit<CR>:terminal<CR>

  nnoremap <silent><C-t>- <Esc>:botright split<CR>:terminal<CR>
  inoremap <silent><C-t>- <Esc>:botright split<CR>:terminal<CR>
  tnoremap <silent><C-t>- <C-\><C-n>:botright split<CR>:terminal<CR>
else
  tnoremap <silent><C-t>q <C-\><C-n>:exit<CR>
  tnoremap <silent><C-t>x <C-\><C-n>

  nnoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>c <C-\><C-n>:tabnew<CR>:terminal ++curwin<CR>

  nnoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>\| <C-\><C-n>:botright vsplit<CR>:terminal ++curwin<CR>

  nnoremap <silent><C-t>- <Esc>:botright split<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>- <Esc>:botright split<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>- <C-\><C-n>:botright split<CR>:terminal ++curwin<CR>
endif

nnoremap <silent><C-t>n <Esc>:tabnew<CR>
inoremap <silent><C-t>n <Esc>:tabnew<CR>
tnoremap <silent><C-t>n <C-\><C-n>:tabnew<CR>

nnoremap <silent><C-t>1 <Esc>1gt
inoremap <silent><C-t>1 <Esc>1gt
tnoremap <silent><C-t>1 <C-\><C-n>1gt

nnoremap <silent><C-t>2 <Esc>2gt
inoremap <silent><C-t>2 <Esc>2gt
tnoremap <silent><C-t>2 <C-\><C-n>2gt

nnoremap <silent><C-t>3 <Esc>3gt
inoremap <silent><C-t>3 <Esc>3gt
tnoremap <silent><C-t>3 <C-\><C-n>3gt

nnoremap <silent><C-t>4 <Esc>4gt
inoremap <silent><C-t>4 <Esc>4gt
tnoremap <silent><C-t>4 <C-\><C-n>4gt

nnoremap <silent><C-t>5 <Esc>5gt
inoremap <silent><C-t>5 <Esc>5gt
tnoremap <silent><C-t>5 <C-\><C-n>5gt

nnoremap <silent><C-t>6 <Esc>6gt
inoremap <silent><C-t>6 <Esc>6gt
tnoremap <silent><C-t>6 <C-\><C-n>6gt

nnoremap <silent><C-t>7 <Esc>7gt
inoremap <silent><C-t>7 <Esc>7gt
tnoremap <silent><C-t>7 <C-\><C-n>7gt

nnoremap <silent><C-t>8 <Esc>8gt
inoremap <silent><C-t>8 <Esc>8gt
tnoremap <silent><C-t>8 <C-\><C-n>8gt

nnoremap <silent><C-t>9 <Esc>9gt
inoremap <silent><C-t>9 <Esc>9gt
tnoremap <silent><C-t>9 <C-\><C-n>9gt

" auto-complete
" -------------
let g:asyncomplete_auto_popup = 1

augroup asyncomplete-completer
  autocmd!

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
augroup END

" Files
" =====

" filetype
" --------
filetype plugin indent on

" backup
" ------
if has('win32') || has('win64')
  set directory=C:/Users/nyarla/AppData/Local/Temp/nvim/swap
  set backupdir=C:/Users/nyarla/AppData/Local/Temp/nvim/backup
else
  set directory=~/.cache/nvim/swap
  set backupdir=~/.cache/nvim/backup
endif

" auto-format
" -----------
augroup auto-format
  autocmd!
  autocmd BufWritePre *.c undojoin | Neoformat
  autocmd BufWritePre *.cc undojoin | Neoformat
  autocmd BufWritePre *.cpp undojoin | Neoformat
  autocmd BufWritePre *.css undojoin | Neoformat
  autocmd BufWritePre *.go undojoin | Neoformat
  autocmd BufWritePre *.h undojoin | Neoformat
  autocmd BufWritePre *.hpp undojoin | Neoformat
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

" Extra
" =====

" Todo Markdown
" -------------
function! EnableTodoMarkdown()
  syn match todoMarkdownPrefix /^\s*-\s*/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownLabel
  syn match todoMarkdownCheckBox /\[ \]/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem
  syn match todoMarkdownCheckedBox /\[x\]/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem
  syn match todoMarkdownDate /!(\d\{4}-\d\{2}-\d\{2})/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownListItem
  syn match todoMarkdownAM1 /午前/ contained containedin=todoMarkdownListItem
  syn match todoMarkdownAM2 /正午/ contained containedin=todoMarkdownListItem
  syn match todoMarkdownPM1 /午後/ contained containedin=todoMarkdownListItem
  syn match todoMarkdownPM2 /夕方/ contained containedin=todoMarkdownListItem
  syn match todoMarkdownDAY /一日/ contained containedin=todoMarkdownListItem

  syn match todoMarkdownLabel /^- [A-Z0-9\-]\+/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownListItem 

  syn match todoMarkdownDoneItem /\(\s*\)-\s*\[x\]\s*[^\n]\+\n\(  \1\s*-[^\n]\+\n\)*/
  syn match todoMarkdownTaskItem /\(\s*\)-\s*\[ \]\s*[^\n]\+\n/
  syn match todoMarkdownListItem /\(\s*\)-\s[^\n\[\]]\+\n/

  hi todoMarkdownLabel cterm=underline gui=underline
  hi todoMarkdownPrefix ctermfg=Cyan cterm=none guifg=#00CCCC
  hi todoMarkdownCheckBox ctermfg=Yellow guifg=#FFCC33
  hi todoMarkdownCheckedBox ctermfg=Blue guifg=#00CCFF
  hi todoMarkdownDate ctermfg=Green guifg=#CCFF00

  hi todoMarkdownAM1 ctermfg=Blue guifg=#00CCFF
  hi todoMarkdownAM2 ctermfg=Yellow guifg=#FFCC33
  hi todoMarkdownPM1 ctermfg=Cyan guifg=#00CCCC
  hi todoMarkdownPM2 ctermfg=Red guifg=#FF6633
  hi todoMarkdownDAY ctermfg=Magenta guifg=#CC99CC

  hi todoMarkdownDoneItem ctermfg=gray cterm=strikethrough guifg=#CCCCCC gui=strikethrough

  function! FoldText()
    let line = getline(v:foldstart)
    let out = substitute(line, '^\(\s*\)-', '\1+', '')
    return out 
  endfunction

  set foldtext=FoldText()
  set foldmethod=expr
  set foldexpr=FoldExpr(v:lnum)

  function! FoldExpr(lnum) 
    if getline(a:lnum) !~ '\s*-'
      return 0
    endif

    let l = a:lnum 

    let c = indent(a:lnum) / &shiftwidth
    let n = indent(a:lnum + 1) / &shiftwidth

    if c < n
      return c + 1
    endif

    if c > n
      return '<' . c
    endif

    if c == n
      return c
    endif
  endfunction

  function! ToggleDone()
    let line = getline('.')

    if line =~ '\[ \]'
      call setline( '.', substitute(line, '\[ \]', '[x]', '') )
    elseif line =~ '\[x\]'
      call setline( '.', substitute(line, '\[x\]', '[ ]', '') )
    endif
  endfunction
  
  inoremap <C-c> <Esc>
  
  nnoremap <silent><C-Space> :call ToggleDone()<CR>
  nnoremap <silent>zu zxggVGzO
  vnoremap <silent>zl :s/\(\s*\)-\s/\1- [ ] /<CR>:noh<CR>
  vnoremap <silent>zs :sort<CR>
  set nofoldenable
endfunction

autocmd BufRead,BufNewFile *.todo.md call EnableTodoMarkdown()

" Auto-start
" ==========
function! OpenVim()
  if argc() == 0
    if has('nvim')
      exec 'terminal'
      exec 'startinsert'
    endif
  elseif argc() == 1 && isdirectory(argv()[0]) && exists('s:is_stdin')
    exec 'NERDTree' argv()[0]
  endif
endfunction

augroup open-vim
  autocmd!
  autocmd StdinReadPre * let s:is_stdin = 1
  autocmd VimEnter * call OpenVim()
augroup END
