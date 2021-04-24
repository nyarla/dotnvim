all:
	@echo Usage: make <nvim|vim>

nvim: cache nvimrc dein

vim: cache vimrc dein

dein:
	test -d ~/.local/share/dein || ( mkdir -p ~/.local/share/dein; \
		curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh - ~/.local/share/dein )

cache:
	test -d ~/.cache/nvim/backup || mkdir -p ~/.cache/nvim/backup
	test -d ~/.cache/nvim/swap || mkdir -p ~/.cache/nvim/swap

vimrc:
	test -d ~/.config || mkdir -p ~/.config
	ln -sf ~/local/dotnvim ~/.config/nvim
	test -e ~/.vim || ln -sf ~/local/dotnvim ~/.vim
	test -e ~/.vimrc || ln -sf ~/local/dotnvim/init.vim ~/.vimrc

nvimrc:
	test -d ~/.config || mkdir -p ~/.config
	ln -sf ~/local/dotnvim ~/.config/nvim
