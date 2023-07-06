-- Map Leader Key to Space for plugins and custom macros (do it first before loading any plugins)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Show relative line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Always use OS clipboard (don't have to deal wiht * and + registers)
vim.o.clipboard = 'unnamedplus'

-- Wrapped lines will indent themselves the same amount as the start line to preserve horizontal blocks of text
vim.o.breakindent = true

-- Make sure a tab is always 4 spaces
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Makes vim try to intelligently auto indent
vim.o.smartindent = true

-- Always have 2 extra columns for signs (i.e. breakpoints, git info, etc.)
vim.wo.signcolumn = 'yes'

-- Tries to keep a persistent-undo (<- help) so you can do an undo on a file even after restarting the session if the file has not been changed by something else
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- On search don't highlight everything and show incremental search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Enables 24-bit RGB color in the TUI. Requires an ISO-8613-3 compatible terminal.
vim.o.termguicolors = true

-- In normal and visual mode make space (leader key) silently do nothing while waiting for the next input
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap. gk and gj are visual move up/down which helps for wrapped lines. The v:count check lets it jump normally when doing 3j for example.
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.o.wrap = false -- ^ Uncomment above mappings if we ever enable wrapping

-- When moving up/down page or search recenter the page to keep cursor in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Retain Clipboard Paste -> deletes highlighted element to void then pastes to avoid overwriting clipboard with deleted line
vim.keymap.set('x', '<leader>p', "\"_dp")
vim.keymap.set({'n','v'}, '<leader>d', "\"_d") -- Delete to void to protect cliboard as well 

-- Diagnostic keymaps to move through errors reported by LSPs, compilers etc.
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
