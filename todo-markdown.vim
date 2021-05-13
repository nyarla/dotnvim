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
