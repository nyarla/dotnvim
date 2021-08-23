set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:color_name = "kalaclista"
let s:colors  = {
        \ 'dark'    : [ "00", "#000000" ],
        \ 'gray'    : [ "08", "#666666" ],
        \ 'light'   : [ "07", "#F9F9F9" ],
        \ 'bright'  : [ "15", "#FFFFFF" ],
        \ 'red'     : [ "01", "#FF6633" ],
        \ 'green'   : [ "02", "#CCFF00" ],
        \ 'yellow'  : [ "03", "#FFCC33" ],
        \ 'blue'    : [ "04", "#00CCFF" ],
        \ 'magenta' : [ "05", "#CC99CC" ],
        \ 'cyan'    : [ "06", "#00CCCC" ],
        \ 'NONE'    : [ "NONE", "NONE"  ],
        \ }

if has('nvim')
  let g:terminal_color_0 = s:colors['dark'][1]
  let g:terminal_color_1 = s:colors['red'][1]
  let g:terminal_color_2 = s:colors['green'][1]
  let g:terminal_color_3 = s:colors['yellow'][1]
  let g:terminal_color_4 = s:colors['blue'][1]
  let g:terminal_color_5 = s:colors['magenta'][1]
  let g:terminal_color_6 = s:colors['cyan'][1]
  let g:terminal_color_7 = s:colors['light'][1]
  let g:terminal_color_8 = s:colors['gray'][1]
  let g:terminal_color_9 = s:colors['red'][1]
  let g:terminal_color_10 = s:colors['green'][1]
  let g:terminal_color_11 = s:colors['yellow'][1]
  let g:terminal_color_12 = s:colors['blue'][1]
  let g:terminal_color_13 = s:colors['magenta'][1]
  let g:terminal_color_14 = s:colors['cyan'][1]
  let g:terminal_color_15 = s:colors['bright'][1]
  let g:terminal_color_background = s:colors['dark'][1]
  let g:terminal_color_foreground = s:colors['light'][1]
elseif has('terminal')
  let g:terminal_ansi_colors = [
        \ s:colors['dark'][1],
        \ s:colors['red'][1],
        \ s:colors['green'][1],
        \ s:colors['yellow'][1],
        \ s:colors['blue'][1],
        \ s:colors['magenta'][1],
        \ s:colors['cyan'][1],
        \ s:colors['light'][1],
        \ s:colors['gray'][1],
        \ s:colors['red'][1],
        \ s:colors['green'][1],
        \ s:colors['yellow'][1],
        \ s:colors['blue'][1],
        \ s:colors['magenta'][1],
        \ s:colors['cyan'][1],
        \ s:colors['bright'][1],
        \ ]
endif

function! g:KalaclistaHighlight(group, fg, bg, ...)
  let l:attr = get(a:, 1, "")

  if a:fg != ""
    let l:color = get(s:colors, a:fg, s:colors['light'])
    exec "hi " . a:group . " ctermfg=" . l:color[0] . " guifg=" . l:color[1]
  endif

  if a:bg != ""
    let l:color = get(s:colors, a:bg, s:colors['dark'])
    exec "hi " . a:group . " ctermbg=" . l:color[0] . " guibg=" . l:color[1]
  endif

  if l:attr != ""
    exec "hi " . a:group . " cterm=" . l:attr . " gui=" . l:attr 
  endif
endfunction

function! s:hi(group, fg, bg, attr)
  call g:KalaclistaHighlight(a:group, a:fg, a:bg, a:attr)
endfunction

" Interface
" ---------

" text
call s:hi('Normal', 'light', '', '')
call s:hi('Bold', '',  '', 'bold')
call s:hi('Directory','cyan', '', '')
call s:hi('NonText', 'gray', '', '')
call s:hi('SpecialKey', 'cyan', '', 'bold')

call s:hi('MoreMsg', 'green', '', 'bold')
call s:hi('ModeMsg', 'blue', '', 'bold')
call s:hi('Question', 'blue', '', 'bold')
call s:hi('MatchParen', 'dark', 'blue', 'bold')

" UI
call s:hi('Cursor', 'dark', 'green', 'bold')
call s:hi('Visual', 'dark', 'blue', '')

call s:hi('LineNr', 'gray', 'dark', '')
call s:hi('LineNrAbove', 'gray', 'dark', '')
call s:hi('LineNrBelow', 'gray', 'dark', '')
call s:hi('CursorLine', '', '', 'NONE')
call s:hi('CursorLineNr', 'bright', 'dark', '')

call s:hi('Search', 'NONE', 'NONE', 'bold,underline')
call s:hi('IncSearch', 'NONE', 'NONE', 'bold,underline')

call s:hi('VertSplit', 'bright', 'NONE', 'NONE')
call s:hi('SignColumn', '', 'dark', 'NONE')

call s:hi('Pmenu', 'bright', 'gray', 'NONE')
call s:hi('PmenuSel', 'dark', 'blue', 'bold')
call s:hi('PmenuSbar', 'NONE', 'gray', 'NONE')
call s:hi('PmenuThumb', 'NONE', 'blue', 'NONE')

call s:hi('StatusLine', 'bright', 'dark', 'bold')
call s:hi('StatusLineNC', 'bright', 'dark', 'NONE')

" msg
call s:hi('Error', 'bright', 'red', 'bold')
call s:hi('ErrorMsg', 'red', 'dark', 'bold')
call s:hi('WarningMsg', 'yellow', 'dark','bold')

" Syntax
" ------

" meta
call s:hi('Title', 'light', '', 'bold')
call s:hi('Comment', 'gray', '', 'bold')

" vars
call s:hi('Constant', 'bright', '', 'NONE')
call s:hi('String', 'yellow', '', 'NONE')
call s:hi('Character', 'blue', '', '') 
call s:hi('Number', 'yellow', '', '')
call s:hi('Float', 'yellow', '', '')
call s:hi('Boolean', 'green', '', '')

call s:hi('Identifier', 'light', '', 'bold')
call s:hi('Function', 'cyan', '', 'bold')

" statements
call s:hi('Statement', 'green', '', 'NONE')
call s:hi('Operator', '', '', 'bold')

" preproc
call s:hi('PreProc', 'yellow', '', 'NONE')

" types
call s:hi('Type', 'cyan', '', 'NONE')

" special
call s:hi('Special', 'blue', '', 'NONE')

" others
call s:hi('Underlined', '', '', 'bold')
call s:hi('Ignore', 'gray', '', '')
call s:hi('Todo', 'dark', 'yellow', '')

" Filetype
" --------

" html
call s:hi('htmlTag', 'blue', '', '')
call s:hi('htmlEndTag', 'blue', '', '')

" xml
call s:hi('xmlTag', 'blue', '', '')
call s:hi('xmlEndTag', 'blue', '', '')
call s:hi('xmlTagName', 'green', '', '')

" yaml
call s:hi('yamlBool', 'green', '', '')
call s:hi('yamlBlockMappingKey', 'light', '', 'NONE')
call s:hi('yamlFlowMappingKey', 'light', '', 'NONE')

" markdown
call s:hi('markdownHeadingDelimiter', 'green', '', 'bold')
call s:hi('markdownLink', 'yellow', '', '')

" perl
call s:hi('perlIdentifier', 'light', '', 'NONE')
call s:hi('perlOperator', 'blue', '', 'NONE')
call s:hi('perlSubName', 'blue', '', 'bold')
call s:hi('perlPackageDecl', 'blue', '', '')
call s:hi('perlStatementPackage', 'green', '', '')

" Cleanup
" -------
delf s:hi
