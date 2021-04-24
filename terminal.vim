if has('nvim')
  autocmd TermOpen * set nonumber | startinsert

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
else

  tnoremap <silent><C-t>q <C-\><C-n>:exit<CR>
  tnoremap <silent><C-t>x <C-\><C-n>

  nnoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>c <Esc>:tabnew<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>c <C-\><C-n>:tabnew<CR>:terminal ++curwin<CR>

  nnoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>\| <Esc>:botright vsplit<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>\| <C-\><C-n>:botright vsplit<CR>:terminal ++curwin<CR>

  nnoremap <silent><C-t>- <Esc>:botright split<CR>:terminal ++curwin<CR>
  inoremap <silent><C-t>- <Esc>:botright split<CR>:terminal ++curwin<CR>
  tnoremap <silent><C-t>- <C-\><C-n>:botright split<CR>:terminal ++curwin<CR>

endif

nnoremap <silent><C-t>n <Esc>:tabnew<CR>
inoremap <silent><C-t>n <Esc>:tabnew<CR>
tnoremap <silent><C-t>n <C-\><C-n>:tabnew<CR>

nnoremap <silent><C-t>1 <Esc>1gt
inoremap <silent><C-t>1 <Esc>1gt
tnoremap <silent><C-t>1 <C-\><C-n>1gt

nnoremap <silent><C-t>2 <Esc>2gt
inoremap <silent><C-t>2 <Esc>2gt
tnoremap <silent><C-t>2 <C-\><C-n>2gt

nnoremap <silent><C-t>3 <Esc>3gt
inoremap <silent><C-t>3 <Esc>3gt
tnoremap <silent><C-t>3 <C-\><C-n>3gt

nnoremap <silent><C-t>4 <Esc>4gt
inoremap <silent><C-t>4 <Esc>4gt
tnoremap <silent><C-t>4 <C-\><C-n>4gt

nnoremap <silent><C-t>5 <Esc>5gt
inoremap <silent><C-t>5 <Esc>5gt
tnoremap <silent><C-t>5 <C-\><C-n>5gt

nnoremap <silent><C-t>6 <Esc>6gt
inoremap <silent><C-t>6 <Esc>6gt
tnoremap <silent><C-t>6 <C-\><C-n>6gt

nnoremap <silent><C-t>7 <Esc>7gt
inoremap <silent><C-t>7 <Esc>7gt
tnoremap <silent><C-t>7 <C-\><C-n>7gt

nnoremap <silent><C-t>8 <Esc>8gt
inoremap <silent><C-t>8 <Esc>8gt
tnoremap <silent><C-t>8 <C-\><C-n>8gt

nnoremap <silent><C-t>9 <Esc>9gt
inoremap <silent><C-t>9 <Esc>9gt
tnoremap <silent><C-t>9 <C-\><C-n>9gt
