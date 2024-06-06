return {
  {
    "vim-test/vim-test",
    dependencies = {
      "christoomey/vim-tmux-runner",
    },
    enabled = false,
    config = function()
      -- vim.cmd([[let test#strategy = "neovim_sticky"]])
      -- vim.cmd([[let test#strategy = "vtr"]])
      vim.cmd([[let test#strategy = "toggleterm"]])
      vim.cmd([[let test#javascript#playwright#options = "--headed --retries 0 --workers 1"]])

      -- vim.cmd("autocmd VimEnter * lua local ok, err = pcall(vim.cmd, 'VtrAttachToPane 1')")

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", opts)
      vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", opts)
      vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<cr>", opts)
      vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", opts)
      vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<cr>", opts)
    end,
  },
  {
    "nvim-neotest/neotest",
    enabled = true,
    ft = { "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "stevearc/overseer.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local setup_python_adapter = require("neotest-python")
      local beyond_py_args = {
        "--disable-warnings",
        "-vv",
        "--ds",
        "beyond_app.settings.test",
      }
      local is_beyond_py = vim.fn.expand("%:p:h"):find("/opt/loggi/py/apps/beyond/") ~= nil
      local python_args = { "--log-level", "DEBUG" }
      if is_beyond_py then
        python_args = beyond_py_args
      end

      vim.o.signcolumn = "yes"
      require("neotest").setup({
        status = {
          signs = true,
          virtual_text = true,
        },
        adapters = {
          setup_python_adapter({
            dap = { justMyCode = true },
            args = python_args,
          }),
        },
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
        overseer = {
          enabled = true,
          -- When this is true (the default), it will replace all neotest.run.* commands
          force_default = false,
        },
      })
    end,
    keys = {
      {
        "<leader>tn",
        function()
          local beyond_env = {
            POSTGRES_DB = "dev_db",
            POSTGRES_PASSWORD = "postgres",
            POSTGRES_HOST = "localhost",
            POSTGRES_PORT = "5432",
          }
          local is_beyond_py = vim.fn.expand("%:p:h"):find("/opt/loggi/py/apps/beyond/") ~= nil

          if is_beyond_py then
            require("neotest").overseer.run({ env = beyond_env })
          else
            require("neotest").run.run()
          end
        end,
        { desc = "Run nearest test" },
      },
      {
        "<leader>td",
        function()
          local beyond_env = {
            POSTGRES_DB = "dev_db",
            POSTGRES_PASSWORD = "postgres",
            POSTGRES_HOST = "localhost",
            POSTGRES_PORT = "5432",
          }
          local is_beyond_py = vim.fn.expand("%:p:h"):find("/opt/loggi/py/apps/beyond/") ~= nil

          if is_beyond_py then
            require("neotest").run.run({ strategy = "dap", env = beyond_env })
          else
            require("neotest").run.run({ strategy = "dap" })
          end
        end,
        { desc = "Debug nearest test" },
      },
      {
        "<leader>tf",
        function()
          local beyond_env = {
            POSTGRES_DB = "dev_db",
            POSTGRES_PASSWORD = "postgres",
            POSTGRES_HOST = "localhost",
            POSTGRES_PORT = "5432",
          }
          local is_beyond_py = vim.fn.expand("%:p:h"):find("/opt/loggi/py/apps/beyond/") ~= nil
          if is_beyond_py then
            require("neotest").overseer.run({ vim.fn.expand("%"), env = beyond_env })
          else
            require("neotest").run.run(vim.fn.expand("%"))
          end
        end,
        { desc = "Run file tests" },
      },
      {
        "<leader>ta",
        function()
          local beyond_env = {
            POSTGRES_DB = "dev_db",
            POSTGRES_PASSWORD = "postgres",
            POSTGRES_HOST = "localhost",
            POSTGRES_PORT = "5432",
          }
          local is_beyond_py = vim.fn.expand("%:p:h"):find("/opt/loggi/py/apps/beyond/") ~= nil
          if is_beyond_py then
            require("neotest").overseer.run({ "/opt/loggi/py/apps/beyond/src/beyond_app", env = beyond_env })
          else
            require("neotest").run.run(vim.fn.getcwd())
          end
        end,
        { desc = "Run all tests" },
      },
      {
        "<leader>tl",
        function()
          require("neotest").output_panel.clear()
          require("neotest").run.run_last()
        end,
        { desc = "Run last" },
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        { desc = "Toggle summary" },
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, quiet = true })
        end,
        { desc = "Toggle output" },
      },
      {
        "<leader>tp",
        function()
          require("neotest").output_panel.toggle()
        end,
        { desc = "Toggle output panel" },
      },
    },
  },
}
