REPO = $(abspath .)

F_VIMRC = vimrc
F_GVIMRC = gvimrc

repofile = $(addprefix $(REPO)/,$(1))
realfile = $(addprefix $(HOME)/.,$(1))

.PHONY: all
all: $(call realfile,$(F_VIMRC)) $(call realfile,$(F_GVIMRC))

$(call realfile,$(F_VIMRC)): $(call repofile,$(F_VIMRC))
	ln -s $(call repofile,$(F_VIMRC)) $(call realfile,$(F_VIMRC))

$(call realfile,$(F_GVIMRC)): $(call repofile,$(F_GVIMRC))
	ln -s $(call repofile,$(F_GVIMRC)) $(call realfile,$(F_GVIMRC))
