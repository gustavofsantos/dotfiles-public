local harpoon = require("harpoon")
if (not harpoon) then return end

harpoon.setup {  }

-- mark file with harpoon
vim.keymap.set("n", "<leader>am", require('harpoon.mark').add_file)
vim.keymap.set("n", "<leader>]m", require('harpoon.ui').nav_next, { desc = "Next [M]ark" })
vim.keymap.set("n", "<leader>[m", require('harpoon.ui').nav_prev, { desc = "Previous [M]ark" })
vim.keymap.set("n", "<leader>fm", require("harpoon.ui").toggle_quick_menu, { desc = "[F]ind [M]arks" }) -- find marks
