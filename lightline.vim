" lightline
" =========

" Components
" ----------

function! LightlineIcon(icon)
  let symbols = {
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

  return get(symbols, a:icon, "")
endfunction

function! LightlineDate()
  return system("echo -n $(date '+%Y-%m-%d')")
endfunction

function! LightlineHost()
  return system("echo -n $(hostname)")
endfunction

function! LightlineUser()
  return system('echo -n $USER')
endfunction

function! LightlineNewTab(idx, count, button, mod)
  if a:count == 1 && a:button == "l"
    tabnew
  endif
endfunction

function! LightlineBufName(fname)
  if a:fname =~ "NERD_tree"
    return 'NERDTree'
  endif

  if a:fname !=# ""
    return a:fname
  endif

  return '<new>'
endfunction

function! LightlineBufFn()
  let fname = expand('%:t')
  let label = LightlineBufName(fname)

  if label !=# 'NERDTree'
    return fname
  endif

  return ''
endfunction

function! LightlineBufState()
  let fname = expand('%:t')
  let label = LightlineBufName(fname)

  if label ==# "NERDTree"
    return LightlineIcon('nerdtree') . ' ' . label
  endif

  return lightline#mode()
endfunction

function! LightlineBufIcon()
  let colors = {
        \ 'go':     [ '#0099FF', '#000000', 'blue',   'black' ],
        \ 'vim':    [ '#99CCFF', '#000000', 'green',  'black' ],
        \ 'spvm':   [ '#0099FF', '#000000', 'blue',   'black' ],
        \ }

  let fname = expand('%:t')
  let label = LightlineBufName(fname)

  if label ==# "NERDTree"
    return ""
  endif

  if &filetype !=# ''
    let ft   = &filetype
    let icon  = WebDevIconsGetFileTypeSymbol()
    let color = get(colors, ft, ['#FFFFFF', '#000000', 'white', 'black'])

    if icon !=# ''
      execute printf("hi LightlineBufIcon ctermfg=%s ctermbg=%s guifg=%s guibg=%s", color[2], color[3], color[0], color[1])
      return icon
    endif
  endif

  return ''
endfunction

function! LightlineTabName(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = expand('#' . buflist[winnr - 1] . ':t')

  if fname =~ 'todo\.md$'
    return LightlineDate() . ' (' . system('echo -n $(LC_ALL=ja_JP.UTF-8 date +%a)') . ')'
  endif

  return LightlineBufName(fname)
endfunction

function! LightlineTabState(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = LightlineBufName(expand('#' . buflist[winnr - 1] . ':t'))
  
  if fname ==# "NERDTree"
    return LightlineIcon('nerdtree')
  endif

  if fname =~ 'todo\.md$'
    return LightlineIcon('calendar')
  endif

  if gettabwinvar(a:n, winnr, '&readonly')
    return LightlineIcon('readonly')
  endif

  return ''
endfunction

" Colorscheme
" -----------
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
hi TablineIconUname ctermfg=Blue ctermbg=Black guifg=#00CCFF guibg=#000000

hi LightlineLabel ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000
hi LightlineBufIcon ctermfg=White ctermbg=Black guifg=#F9F9F9 guibg=#000000

" Widgets
" -------
let s:separator = {'left': '', 'right': ''}
let s:modemap   = {
      \ 'n'       : LightlineIcon('normal')   . ' NORMAL',
      \ 'i'       : LightlineIcon('insert')   . ' INSERT',
      \ 'R'       : LightlineIcon('replace')  . ' REPLACE',
      \ 'v'       : LightlineIcon('visual')   . ' VISUAL',
      \ 'V'       : LightlineIcon('v-line')   . ' V-LINE',
      \ '\<C-v>'  : LightlineIcon('v-block')  . ' V-BLOCK',
      \ 'c'       : LightlineIcon('command')  . ' COMMAND',
      \ 's'       : LightlineIcon('select')   . ' SELECT',
      \ 'S'       : LightlineIcon('s-line')   . ' S-LINE',
      \ '\<C-s>'  : LightlineIcon('s-block')  . ' S-BLOCK',
      \ 't'       : LightlineIcon('terminal') . ' TERMINAL',
      \ }

let g:lightline = {
  \ 'colorscheme': s:colorscheme,
  \ 
  \ 'component': {
  \   'date': "%#TablineIconCal#%{LightlineIcon('calendar')} %#TablineLabel#%{LightlineDate()}",
  \   'hostname': "%#TablineIconHost#%{LightlineIcon('host')} %#TablineLabel#%{LightlineHost()}",
  \   'uname': "%#TablineIconUname#%{LightlineIcon('uname')} %#TablineLabel#%{LightlineUser()}",
  \   'close': "%#TablineIconClose#%999X%{LightlineIcon('close')}  ",
  \   'open': "%#TablineIconNew#%@LightlineNewTab@ %{LightlineIcon('new')}%T",
  \   'bufState': "%{LightlineBufState()}",
  \   'bufFn': "%#LightlineBufIcon#%{LightlineBufIcon()} %#LightlineLabel#%{LightlineBufFn()}",
  \ },
  \ 'component_function': {},
  \ 'component_raw': {},
  \ 'tab_component_function': {
  \   'state': 'LightlineTabState',
  \   'tabName': 'LightlineTabName',
  \ },
  \
  \ 'tabline': {
  \   'left': [ ['open', 'tabs'] ],
  \   'right': [ ['close', 'date', 'uname', 'hostname'] ],
  \ },
  \ 'tab': {
  \   'active': [ 'state', 'tabName' ],
  \   'inactive': [ 'state', 'tabName' ],
  \ },
  \
  \ 'active': {
  \   'left': [ ['bufState'], ['bufFn'] ],
  \   'right': [  ],
  \ },
  \ 'inactive': {
  \   'left': [ ['bufState'], ['bufFn'] ],
  \   'right': [  ],
  \ },
  \
  \ 'mode_map': s:modemap,
  \
  \ 'separator': copy(s:separator),
  \ 'subseparator': copy(s:separator),
  \ 'tablinne_separator': copy(s:separator),
  \ }

