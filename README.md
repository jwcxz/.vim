# jwcxz's [Neo]vim configuration

This repository holds my personal configuration for Neovim and Vim.

I primarily use Neovim, but sometimes fall back to vim, so this repository
primarily provides richness for the former and a reasonable set of
functionality for the latter.


## Profiles

The configuration provides different sets of functionality depending on which
profile is chosen

* `complete`: Provides a full-featured experience, as it is intended to be used
  for anywhere I do significant amounts of editing.  Requires Neovim and has
  external dependencies, including a terminal with a patched font from
  [Nerd Fonts](https://www.nerdfonts.com).

* `portable`: Only includes plugins that do not have external dependencies and
  support both Neovim and Vim.  Useful for being productive in constrained
  environments.

* `noplugin`: Does not load any plugins; only modifies configuration options.
  Useful for rapidly getting to a minimal level of usability.


## Setup

1.  Clone to `$HOME`

2.  `ln -s $HOME/.vim/init.vim $HOME/.vimrc && mkdir -p $HOME/.config/nvim && ln -s $HOME/.vim/init.vim $HOME/.config/nvim/init.vim`
    (or run `make` for now)

3.  Install language servers (see `bundle.config/nvim-lspconfig.vim`)

4.  Invoke `nvim`.  Many things will fail.  After vim-plug is installed, run
    `PlugInstall` and relaunch `nvim` to set up the rest.


## Development Status

Currently, the repository is in the process of being reorganized from providing
general graceful degradation strategy to the more restricted (but
easier-to-manage) profile-based strategy, as I generally only use [Neo]vim in a
prescriptive set of ways nowadays.

Consequently, while the repository is functional, it remains structurally
disorganized while I redesign it to support this new strategy, follow more
modern practices, and fix previous cleanliness issues.
