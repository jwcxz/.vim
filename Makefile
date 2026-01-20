DESTS = ${HOME}/.vimrc ${HOME}/.config/nvim

.PHONY: all
all: $(DESTS)

${HOME}/.vimrc: vimrc
	test -e $@ || ln -s $(abspath $<) $@

${HOME}/.config/nvim: .
	mkdir -p ${HOME}/.config
	test -e $@ || ln -s $(abspath $<) $@
