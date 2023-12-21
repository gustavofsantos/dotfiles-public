return {
  {
    "vim-test/vim-test",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>t"] = {
          name = "+test",
          a = { "<cmd>TestSuite<cr>", "Test all" },
          f = { "<cmd>TestFile<cr>", "Test file" },
          l = { "<cmd>TestLast<cr>", "Test last" },
          n = { "<cmd>TestNearest<cr>", "Test nearest" },
          v = { "<cmd>TestVisit<cr>", "Open latest" },
        },
      })
    end,
  },
}
