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
