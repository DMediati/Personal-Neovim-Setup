local telescope = require("telescope")

-- Enable the faster fuzzy algorithm. Wrapped in a pcall in-case environment doesn't have make and fzf fails to build
pcall(telescope.load_extension, 'fzf')

-- Telescope Keymaps
local builtin = require('telescope.builtin')

-- Try to search only git files and default to searching all files if not in a repo
local TrySearchGitFiles = function()
    if pcall( builtin.git_files ) then
        return
    else
        builtin.find_files();
    end
end

vim.keymap.set('n', '<C-p>', TrySearchGitFiles, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
