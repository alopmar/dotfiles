SHELL := /bin/bash

all: submodules link

link: .vimrc .gitignore_global .bash_profile
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~; )

submodules:
	git submodule init
	git submodule update
