vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
vim.keymap.set("i", "<c-c>", "<Esc>")
vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")
vim.keymap.set("n", "<Esc>", ":noh<cr><Esc>")
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "Switch buffer" })
vim.keymap.set("n", "]c", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "[c", "<cmd>cprevious<cr>", { desc = "Quickfix previous" })

vim.keymap.set("n", "<leader>ss", "<cmd>Switch<CR>")

vim.keymap.set("n", "<c-w>s", "<cmd>vsplit<CR>", { desc = "Split window" })
vim.keymap.set("n", "<c-w><c-s>", "<cmd>vsplit<CR>", { desc = "Split window" })
vim.keymap.set("n", "<c-w>S", "<cmd>split<CR>", { desc = "Split window horizontally" })

vim.keymap.set("v", "vb",
  ':<C-U>!git blame <C-R>=expand("%:p") <CR> | sed -n <C-R>=line("\'<") <CR>,<C-R>=line("\'>") <CR>p <CR>')
