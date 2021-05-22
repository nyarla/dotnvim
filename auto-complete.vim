" Auto complete by asyncomplete
" =============================

" asyncomplete configuration
" --------------------------
let g:asyncomplete_auto_popup = 1

inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" configure custom completer
" --------------------------
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
  \ 'name': 'file',
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#file#completor'),
  \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
  \ 'name': 'emmet',
  \ 'allowlist': ['html', 'xml'],
  \ 'completor': function('asyncomplete#sources#emmet#completor'),
  \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
  \ 'name': 'omni',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#omni#completor'),
  \ 'config': {
  \   'show_source_kind': 1,
  \ }
  \ }))
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
  \ 'name': 'tabnine',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#tabnine#completor'),
  \ 'config': {
  \   'line_limit': 1000,
  \   'max_num_result': 15,
  \  },
  \ }))
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
  \ 'name': 'necosyntax',
  \ 'allowlist': ['*'],
  \ 'blocklist': ['markdown'],
  \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
  \ }))

autocmd User lsp_setup call lsp#register_server({
  \ 'name': 'rnix-lsp',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
  \ 'allowlist': ['nix'],
  \ })

