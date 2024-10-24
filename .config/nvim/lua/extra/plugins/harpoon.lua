return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    vim.keymap.set("n", "<leader>a",
      function() harpoon:list():add() end,
      { desc = "harpoon file" }
    )

    vim.keymap.set("n", "gh",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "toggle harpoon" }
    )

    vim.keymap.set("n", "<M-1>",
      function() harpoon:list():select(1) end,
      { desc = "slot 1" }
    )

    vim.keymap.set("n", "<M-2>",
      function() harpoon:list():select(2) end,
      { desc = "slot 2" }
    )

    vim.keymap.set("n", "<M-3>",
      function() harpoon:list():select(3) end,
      { desc = "slot 3" }
    )

    vim.keymap.set("n", "<M-4>",
      function() harpoon:list():select(4) end,
      { desc = "slot 4" }
    )
  end,
}
