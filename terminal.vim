if has('nvim')
  autocmd TermOpen * set nonumber | startinsert
else
  " TODO
endif

tnoremap <silent><C-t>q <C-\><C-n>:exit<CR>
tnoremap <silent><C-t>x <C-\><C-n>

nnoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal<CR>
inoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal<CR>
tnoremap <silent><C-t>c <C-\><C-n>:tabnew<CR>:terminal<CR>

nnoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal<CR>
inoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal<CR>
tnoremap <silent><C-t>\| <C-\><C-n>:botright vsplit<CR>:terminal<CR>

nnoremap <silent><C-t>- <Esc>:botright split<CR>:terminal<CR>
inoremap <silent><C-t>- <Esc>:botright split<CR>:terminal<CR>
tnoremap <silent><C-t>- <C-\><C-n>:botright split<CR>:terminal<CR>
