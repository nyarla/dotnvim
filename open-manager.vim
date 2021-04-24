" Open manager
" ============

function! s:openNeoVim()
  if argc() == 0
    if has('nvim')
      exec 'set nonumber'
      exec 'terminal'
      exec 'startinsert'
    else
      exec 'set nonumber'
      exec 'terminal! ++curwin'
      exec 'normal i'
    endif
  elseif argc() == 1 && isdirectory(argv()[0]) && exists('s:is_stdin')
    exec 'NERDTree' argv()[0]
  endif
endfunction

augroup open-neovim
  autocmd!
  autocmd StdinReadPre * let s:is_stdin = 1
  autocmd VimEnter * call s:openNeoVim()
augroup END
