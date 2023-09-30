vim.keymap.set('n', 'Q', '<Nop>')

vim.keymap.set('n', '<c-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<c-c>', '<Esc>')
vim.keymap.set('n', '<c-q>', '<cmd>q<cr>')
vim.keymap.set('n', '<Esc>', ':noh<cr><Esc>')
vim.keymap.set('t', '<Esc>', '<c-\\><c-n')
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<c-w>s', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<c-w><c-s>', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<c-w>S', '<cmd>split<cr>')
vim.keymap.set('n', '<c-w><c-S>', '<cmd>split<cr>')

vim.keymap.set('n', '<leader>tn', require("neotest").run.run, { desc = "Test nearest" })
vim.keymap.set('n', '<leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
vim.keymap.set('n', '<leader>tl', require("neotest").run.run_last, { desc = "Test last" })
vim.keymap.set('n', '<leader>to', require("neotest").output.open, { desc = "Test output" })
vim.keymap.set('n', '<leader>ts', require("neotest").summary.toggle, { desc = "Test summary" })

vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
vim.keymap.set("n", "<leader>b",
    ":<C-U>!git blame <C-R>=expand(\"%:p\") <CR> \\| sed -n <C-R>=line(\"'<\") <CR>,<C-R>=line(\"'>\") <CR>p <CR>")
