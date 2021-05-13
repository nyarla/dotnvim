" Open manager
" ============

function! s:openVim()
  if argc() == 0
    if has('nvim')
      exec 'set nonumber'
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
  autocmd VimEnter * call s:openVim()
augroup END
