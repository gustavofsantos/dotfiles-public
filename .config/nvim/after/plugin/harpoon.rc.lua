local harpoon = require("harpoon")
if (not harpoon) then return end

harpoon.setup {  }

-- mark file with harpoon
vim.keymap.set("n", "<leader>m", require('harpoon.mark').add_file)
vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>") -- find marks
