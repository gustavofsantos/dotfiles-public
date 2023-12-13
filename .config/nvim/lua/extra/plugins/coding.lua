return {
  "tpope/vim-sleuth",
  "mbbill/undotree",
  "justinmk/vim-sneak",
  "AndrewRadev/switch.vim",
  "christoomey/vim-tmux-runner",
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "cshuaimin/ssr.nvim",
    dependencies = { "folke/which-key.nvim" },
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("ssr").setup({})
      local wk = require("which-key")

      wk.register({
        s = {
          name = "Structural Replace",
          R = { "<cmd>lua require('ssr').open()<CR>", "Replace" },
        },
      }, { prefix = "<leader>" })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "tpope/vim-projectionist",
    event = "BufRead",
    dependencies = { "folke/which-key.nvim" },
    config = function()
      vim.g.projectionist_heuristics = {
        ["*"] = {
          ["*.js"] = {
            alternate = {
              "{dirname}/{basename}.test.js",
            },
            type = "source",
          },
          ["*.test.js"] = {
            alternate = "{basename}.js",
            type = "test",
          },
        },
      }

      local wk = require("which-key")

      wk.register({
        ga = { "<cmd>A<CR>", "Alternate file" },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          javascript = true,
          typescript = true,
          javascriptreact = true,
          typescriptreact = true,
          python = true,
          lua = true,
          shell = true,
          sh = true,
          markdown = true,
          ["*"] = false,
        },
        suggestion = { enabled = false, auto_trigger = true },
        panel = { enabled = false, auto_refresh = true },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.16.0/bin/node",
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufRead",
    config = function()
      require("refactoring").setup()
      local wk = require("which-key")

      wk.register({
        ["<leader>r"] = { name = "+refactor" },
        ["<leader>rr"] = { "<cmd>lua require('refactoring').select_refactor()<CR>", "Select refactor" },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
