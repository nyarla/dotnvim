function! s:switch_to_cmd()
  set shell=cmd.exe
  set shellquote= shellpipe=>%s\ 2>&1 shellxquote="
  set shellcmdflag=/s\ /c
  set shellredir=>%s\ 2>&1
endfunction

function! s:switch_to_pwsh()
  set shell=pwsh.exe
  set shellquote= shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
endfunction

augroup auto-switch-shell
  autocmd!
  autocmd BufWritePre * call s:switch_to_cmd()
  autocmd BufReadPost * call s:switch_to_pwsh()
  autocmd VimEnter * call s:switch_to_pwsh()
augroup END
