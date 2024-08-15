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
    { 'neovim/nvim-lspconfig' },

    -- Needed to make DAPs work
    { 'mfussenegger/nvim-dap' },

    -- Mason is used to help download LSP servers
    {
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },

    -- bridge between mason and nvim-lspconfig
    { 'williamboman/mason-lspconfig.nvim' },

    -- bridge between mason and nvim-dap
    { 'jay-babu/mason-nvim-dap.nvim' },

    -- dependency for nvim-dap-ui
    { 'nvim-neotest/nvim-nio' },

    -- nicer ui for nvim-dap
    { 'rcarriga/nvim-dap-ui' },

    -- required for autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'l3mon4d3/luasnip' },

    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- leaving default settings 
        }
    },

    -- git related plugins
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
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[g]o to [p]revious hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[g]o to [n]ext hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[p]review [h]unk' })
            end,
        },
    },

    -- quick comment and comment block
    'tpope/vim-commentary'
})
