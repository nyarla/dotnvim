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

  hi todoMarkdownLabel cterm=underline
  hi todoMarkdownPrefix ctermfg=Cyan cterm=none
  hi todoMarkdownCheckBox ctermfg=Yellow
  hi todoMarkdownCheckedBox ctermfg=Blue
  hi todoMarkdownDate ctermfg=Green

  hi todoMarkdownAM1 ctermfg=Blue
  hi todoMarkdownAM2 ctermfg=Yellow
  hi todoMarkdownPM1 ctermfg=Cyan
  hi todoMarkdownPM2 ctermfg=Red
  hi todoMarkdownDAY ctermfg=Magenta

  hi todoMarkdownDoneItem ctermfg=gray cterm=strikethrough

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
