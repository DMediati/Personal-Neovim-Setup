-- Setup some basic nvim settings
require("Personal-Neovim-Setup.base-settings")

-- Bootstrap lazy package manager to handle plugins
require("Personal-Neovim-Setup.lazy-init")

-- Use lazy to load in all the plugins/packages/dependencies
require("Personal-Neovim-Setup.lazy-plugins")

-- Customize Telescope
require("Personal-Neovim-Setup.telescope-setup")

-- Setup LSP 
require("Personal-Neovim-Setup.lsp-setup")

-- Setup Treesitter 
require("Personal-Neovim-Setup.treesitter-setup")
