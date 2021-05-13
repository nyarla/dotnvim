if &compatible
  set nocompatible
endif

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

if has('win32') || has('win64')
  let g:dotnvim="$HOME/AppData/Local/dotnvim"
  set shell=cmd.exe
else
  let g:dotnvim="$HOME/local/dotnvim"
  set shell=sh
endif

execute printf("source %s/%s", g:dotnvim, 'core.vim')
execute printf("source %s/%s", g:dotnvim, 'plugins.vim')
execute printf("source %s/%s", g:dotnvim, 'auto-complete.vim')
execute printf("source %s/%s", g:dotnvim, 'auto-format.vim')
execute printf("source %s/%s", g:dotnvim, 'lightline.vim')
execute printf("source %s/%s", g:dotnvim, 'terminal.vim')
execute printf("source %s/%s", g:dotnvim, 'open-manager.vim')
execute printf("source %s/%s", g:dotnvim, 'todo-markdown.vim')

if has('win32') || has('win64')
  let g:dotnvim="$HOME/AppData/Local/dotnvim"
  set shell=~/scoop/apps/pwsh/current/pwsh.exe
else
  let g:dotnvim="$HOME/local/dotnvim"
  set shell=zsh
endif
