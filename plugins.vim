" Plugins with dein
" =================

" enable dein
" -----------
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_github_api_token = system('grep password ~/.netrc | cut -d\  -f2 | sed -z "s/\n//"')

" load plugins
" ------------
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein', [expand('<sfile>')])
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  
  " file manager TODO: chage to defx and lightline
  " ------------
  call dein#add('preservim/nerdtree', {'rev': '6.9.11'})
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('itchyny/lightline.vim')

  " call dein#add('vim-airline/vim-airline')

  " auto-complete
  " ------------- 
  call dein#add('Shougo/neco-syntax')
  call dein#add('mattn/emmet-vim') 
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/asyncomplete-file.vim')
  call dein#add('prabirshrestha/asyncomplete-emmet.vim')
  call dein#add('yami-beta/asyncomplete-omni.vim')
  call dein#add('prabirshrestha/asyncomplete-necosyntax.vim')
  if has('win32') || has('win64')
    call dein#add('kitagry/asyncomplete-tabnine.vim', { 'build': 'powershell.exe .\install.ps1'  })
  else
    call dein#add('kitagry/asyncomplete-tabnine.vim', { 'build': './install.sh'  })
  endif

  " file
  " ----
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('mattn/vim-goimports')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('delphinus/vim-firestore')
  call dein#add('LnL7/vim-nix')
  call dein#add('nyarla/vim-syntax-spvm')
  call dein#add('plasticboy/vim-markdown')

  call dein#add('sbdchd/neoformat')

  " interface
  " ---------
  " call dein#add('dim13/smyck.vim')

  " dein
  " ---- 
  call dein#end()
  call dein#save_state()
endif

syntax on
filetype on
filetype plugin indent on
colorscheme base16-kalaclista

let g:NERDTreeGitStatusUseNerdFonts = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

let g:vim_markdown_fenced_languages = [
      \ 'bash=sh',
      \ 'css=css', 
      \ 'nix=nix', 
      \ 'scss=scss',
      \ ]

let g:vim_markdown_new_list_item_indent = 2
