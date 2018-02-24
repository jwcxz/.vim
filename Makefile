REPO = $(abspath .)

REPO_INIT_FILE := $(REPO)/init.vim
INIT_FILES := $(addprefix $(HOME)/,.vimrc .config/nvim/init.vim)

.PHONY: all
all: $(INIT_FILES)

$(INIT_FILES): $(REPO_INIT_FILE)
	mkdir -p $(dir $@)
	ln -s $< $@
