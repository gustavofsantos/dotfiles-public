vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
vim.keymap.set("i", "<c-c>", "<Esc>")
vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")
vim.keymap.set("n", "<Esc>", ":noh<cr><Esc>")
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "Switch buffer" })

vim.keymap.set("n", "<leader>ss", "<cmd>Switch<CR>")
