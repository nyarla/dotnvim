all: pull syntax

.PHONY: pull _pull syntax

pull:
	@$(MAKE) _pull DEST=pack/commands/start/neoformat BRANCH=master
	@$(MAKE) _pull DEST=pack/commands/start/open-browser BRANCH=master
	@$(MAKE) _pull DEST=pack/development/start/tree-sitter BRANCH=master
	@$(MAKE) _pull DEST=pack/file_manager/start/nvim-tree BRANCH=master
	@$(MAKE) _pull DEST=pack/file_manager/start/nvim-web-devicons BRANCH=master
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-buffer BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-nvim-lsp BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-path BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-tabnine BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-treesitter BRANCH=master
	@$(MAKE) _pull DEST=pack/lsp/start/cmp-vsnip BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/lspkind-nvim BRANCH=master
	@$(MAKE) _pull DEST=pack/lsp/start/nvim-cmp BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/nvim-lsp-installer BRANCH=main
	@$(MAKE) _pull DEST=pack/lsp/start/nvim-lspconfig BRANCH=master
	@$(MAKE) _pull DEST=pack/lsp/start/vim-vsnip BRANCH=master
	@$(MAKE) _pull DEST=pack/lsp/start/vim-vsnip-integ BRANCH=master

syntax:
	cd syntax && make

_pull:
	cd $(DEST) && git pull origin $(BRANCH)
