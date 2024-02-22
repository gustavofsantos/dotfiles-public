return {
  {
    "vim-test/vim-test",
    enabled = true,
    dependencies = {
      "christoomey/vim-tmux-runner",
    },
    config = function()
      vim.cmd([[let test#strategy = "toggleterm"]])
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
  "nvim-neotest/neotest",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      mode = "n",
      desc = "Test file",
    },
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      mode = "n",
      desc = "Test nearest",
    },
    {
      "<leader>tw",
      function()
        require("neotest").run.run({ jestCommand = "jest --watch " })
      end,
      mode = "n",
      desc = "Watch nearest",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      mode = "n",
      desc = "Debug nearest test",
    },
  },
  config = function()
    require("neotest").setup({
      discovery = {
        enabled = false,
      },
      adapters = {
        require("neotest-jest")({
          -- jestCommand = "npm test --",
          -- jestConfigFile = "custom.jest.config.ts",
          jest_test_discovery = false,
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
