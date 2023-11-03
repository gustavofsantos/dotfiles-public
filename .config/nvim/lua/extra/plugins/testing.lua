return {
  {
    "vim-test/vim-test",
    enabled = true,
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", { desc = "Test nearest" })
      vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", { desc = "Test file" })
      vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", { desc = "Test last" })
      vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<cr>", { desc = "Open latest test" })
    end,
  },
  {
    "nvim-neotest/neotest",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest-loggi-beyond")({}),
        },
        icons = {
          running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        },
      })

      vim.keymap.set("n", "<leader>tn", require("neotest").run.run, { desc = "Test nearest" })
      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Test file" })
      vim.keymap.set("n", "<leader>tl", require("neotest").run.run_last, { desc = "Test last" })
      vim.keymap.set("n", "<leader>to", require("neotest").output.open, { desc = "Test output" })
      vim.keymap.set("n", "<leader>ts", require("neotest").summary.toggle, { desc = "Test summary" })
    end,
  },
}
