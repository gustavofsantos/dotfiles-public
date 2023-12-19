return {
  {
    "vim-test/vim-test",
    dependencies = {
      "anuvyklack/hydra.nvim",
    },
    config = function()
      local Hydra = require("hydra")

      Hydra({
        name = "Test",
        hint = [[ Test ]],
        mode = { "n" },
        body = "<leader>t",
        config = {
          invoke_on_body = true,
          hint = {
            border = "rounded",
          },
        },
        heads = {
          { "a", "<cmd>TestSuite<cr>", { silent = true, exit = true, desc = "Test all" } },
          { "f", "<cmd>TestFile<cr>", { silent = true, exit = true, desc = "Test file" } },
          { "l", "<cmd>TestLast<cr>", { silent = true, exit = true, desc = "Test last" } },
          { "n", "<cmd>TestNearest<cr>", { silent = true, exit = true, desc = "Test nearest" } },
          { "v", "<cmd>TestVisit<cr>", { silent = true, exit = true, desc = "Open latest test" } },
          { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
        },
      })
    end,
  },
}
