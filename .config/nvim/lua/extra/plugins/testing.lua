return {
  {
    "vim-test/vim-test",
    enabled = true,
    dependencies = {
      "christoomey/vim-tmux-runner",
    },
    ft = { "javascript" },
    config = function()
      vim.cmd([[let test#strategy = "vtr"]])
      vim.cmd([[let test#javascript#playwright#options = "--headed --retries 0 --workers 1"]])
    end,
    keys = {
      {
        "<leader>ta",
        "<cmd>TestSuite<cr>",
        mode = "n",
        desc = "Test all",
      },
      {
        "<leader>tf",
        "<cmd>TestFile<cr>",
        mode = "n",
        desc = "Test file",
      },
      {
        "<leader>tl",
        "<cmd>TestLast<cr>",
        mode = "n",
        desc = "Test last",
      },
      {
        "<leader>tn",
        "<cmd>TestNearest<cr>",
        mode = "n",
        desc = "Test nearest",
      },
      {
        "<leader>tv",
        "<cmd>TestVisit<cr>",
        mode = "n",
        desc = "Open latest",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            args = function()
              return { "--disable-warnings", "--ds", "beyond_app.settings.development" }
            end,
            dap = { justMyCode = false },
            pytest_discover_instances = true,
          }),
        },
      })

      vim.keymap.set("n", "]t", "<cmd>Neotest jump next<cr>", { desc = "Next test" })
      vim.keymap.set("n", "[t", "<cmd>Neotest jump prev<cr>", { desc = "Previous test" })
      vim.keymap.set("n", "<leader>tf", "<cmd>Neotest run file<cr>", { desc = "Test file" })
      vim.keymap.set("n", "<leader>tl", "<cmd>Neotest run last<cr>", { desc = "Test last" })
      vim.keymap.set("n", "<leader>tn", "<cmd>Neotest run<cr>", { desc = "Test nearest" })

      vim.keymap.set("n", "<leader>tdn", function()
        require("neotest").run.run({ strategy = "dap" })
      end, { desc = "Debug nearest" })

      vim.keymap.set("n", "<leader>to", "<cmd>Neotest output<cr>", { desc = "Test output" })
      vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<cr>", { desc = "Test summary" })
    end,
  },
}
