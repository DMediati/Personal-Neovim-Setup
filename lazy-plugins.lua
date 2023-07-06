-- Use lazy to load in all the plugins/packages/dependencies
require("lazy").setup({

    -- Detect tabstop and shiftwidth automatically (using vim settings for now)
    -- 'tpope/vim-sleuth',

    -- Telescope: Fuzzy Finder
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Fuzzy Finder Algorithm to speed up telescope. Only builds if system has make.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    -- Color scheme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
          vim.cmd.colorscheme 'onedark'
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        build = ":TSUpdate",
    },

    -- Needed to make LSPs work
    { 'neovim/nvim-lspconfig'},

    -- Mason is used to help download LSP servers
    {
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },

    -- Bridge between Mason and nvim-lspconfig
    {'williamboman/mason-lspconfig.nvim'},

    -- Required for Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- Leaving default settings 
        }
    },

    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },

    -- Quick comment and comment block
    'tpope/vim-commentary'
})
