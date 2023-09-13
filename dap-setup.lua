vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle [b]reakpoint" })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = "Set [B]reakpoint" })
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "[l]og [p]oint Message" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "[d]ap [r]epl Open" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "[d]ap run [l]ast" })
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = "[d]ap [h]over" })
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end, { desc = "[d]ap [p]review" })
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = "[d]ap [f]rames" })
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = "[d]ap [s]copes" })


vim.keymap.set('n', '<Leader>dt', function() require("dapui").toggle() end, { desc = "[d]ap ui [t]oggle" })

require('dapui').setup()

require ('mason-nvim-dap').setup({
    ensure_installed = { 'cppdbg' },
    handlers = {}, -- sets up dap in the predefined manner
})
