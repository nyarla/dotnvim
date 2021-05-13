" Auto-formatting
" ===============

" JavaScript / TypeScript
" -----------------------
autocmd BufWritePre *.ts undojoin | Neoformat
autocmd BufWritePre *.js undojoin | Neoformat

" CSS / SCSS
" ----------
autocmd BufWritePre *.css undojoin | Neoformat
autocmd BufWritePre *.scss undojoin | Neoformat

" HTML / XML / Markdown
" ---------------------
autocmd BufWritePre *.html undojoin | Neoformat
autocmd BufWritePre *.xml undojoin | Neoformat
" autocmd BufWritePre *.md undojoin | Neoformat

" JSON / YAML
" -----------
autocmd BufWritePre *.json undojoin | Neoformat
autocmd BufWritePre *.yaml undojoin | Neoformat
autocmd BufWritePre *.ts undojoin | Neoformat

" Nix
" ---
autocmd BufWritePre *.nix undojoin | Neoformat

" Perl
" ----
autocmd BufWrite *.pl undojoin | Neoformat
autocmd BufWrite *.pm undojoin | Neoformat
autocmd BufWrite *.t undojoin | Neoformat
autocmd BufWrite cpanfile undojoin | Neoformat

" C / C++
" -------
autocmd BufWritePre *.c undojoin | Neoformat
autocmd BufWritePre *.h undojoin | Neoformat
"autocmd BufWritePre *.cpp undojoin | Neoformat
"autocmd BufWritePre *.hpp undojoin | Neoformat
autocmd BufWritePre *.cc undojoin | Neoformat

" Go
" --
autocmd BufWritePre *.go undojoin | Neoformat
