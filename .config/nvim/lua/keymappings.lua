vim.keymap.set("n", "Q", "<Nop>")

vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
vim.keymap.set("i", "<c-c>", "<Esc>")
vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")
vim.keymap.set("n", "<Esc>", ":noh<cr><Esc>")
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader><leader>", "<c-^>")
vim.keymap.set("n", "<c-w>s", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<c-w><c-s>", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<c-w>S", "<cmd>split<cr>")

vim.keymap.set("n", "<leader>ss", "<cmd>Switch<CR>")
