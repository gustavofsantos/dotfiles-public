local utils = require("utils")

return {
  {
    "vim-test/vim-test",
    dependencies = {
      "anuvyklack/hydra.nvim",
    },
    config = function()
      local Hydra = require("hydra")

      utils.setup_hydra(Hydra, {
        name = "Test",
        body = "<leader>t",
        heads = {
          { "a", "<cmd>TestSuite<cr>", { silent = true, exit = true, desc = "test all" } },
          { "f", "<cmd>TestFile<cr>", { silent = true, exit = true, desc = "test file" } },
          { "l", "<cmd>TestLast<cr>", { silent = true, exit = true, desc = "test last" } },
          { "n", "<cmd>TestNearest<cr>", { silent = true, exit = true, desc = "test nearest" } },
          { "v", "<cmd>TestVisit<cr>", { silent = true, exit = true, desc = "open latest" } },
          { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
        },
      })
    end,
  },
}
