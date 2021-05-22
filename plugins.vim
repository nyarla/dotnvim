syntax on
colorscheme base16-kalaclista
" =================

" enable dein
" -----------
let s:state = 0
if has('win32') || has('win64')
  set runtimepath+=~/AppData/Local/dein/repos/github.com/Shougo/dein.vim
  let s:state=dein#load_state('~/AppData/Local/dein')
else
  set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
  let g:dein#install_github_api_token = system('grep password ~/.netrc | cut -d\  -f2 | sed -z "s/\n//"')
  let s:state=dein#load_state('~/.local/share/dein')
endif

" load plugins
" ------------
if s:state
  if has('win32') || has('win64')
    call dein#begin('~/AppData/Local/dein', [expand('<sfile>')])
    call dein#add('~/AppData/Local/dein/repos/github.com/Shougo/dein.vim')
  else
    call dein#begin('~/.local/share/dein', [expand('<sfile>')])
    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  endif

  call dein#add('wsdjeg/dein-ui.vim')
  
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  
  " file manager TODO: chage to defx and lightline
  " ------------
  call dein#add('preservim/nerdtree')
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
  call dein#add('PProvost/vim-ps1')

  call dein#add('sbdchd/neoformat')

  " interface
  " ---------
  " call dein#add('dim13/smyck.vim')

  " dein
  " ---- 
  call dein#end()
  call dein#save_state()
endif

if ! (has('win32') || has('win64'))
  let g:base16_shell_path="~/local/dotnvim/colors"
endif
syntax on
colorscheme base16-kalaclista

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
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
