-- Setup some basic nvim settings
require("dmediati-nvim-setup.base-settings")

-- Bootstrap lazy package manager to handle plugins
require("dmediati-nvim-setup.lazy-init")

-- Use lazy to load in all the plugins/packages/dependencies
require("dmediati-nvim-setup.lazy-plugins")

-- Customize Telescope
require("dmediati-nvim-setup.telescope-setup")

-- Setup LSP 
require("dmediati-nvim-setup.lsp-setup")

-- Setup Treesitter 
require("dmediati-nvim-setup.treesitter-setup")
