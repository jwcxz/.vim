cfg_debug("Initializing configuration")

-- configure builtin functionality
require('config.behavior')
require('config.utilities')
require('config.autocmds')
require('config.keybindings')

-- configure plugins
require('config.plugins')

-- enable LSP servers and configure LSP interface behavior
require('config.lsp')
