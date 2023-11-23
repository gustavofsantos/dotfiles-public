return {
  "tpope/vim-sleuth",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "mbbill/undotree",
  "justinmk/vim-sneak",
  "AndrewRadev/switch.vim",
  "github/copilot.vim",
  "christoomey/vim-tmux-runner",
  {
    "cshuaimin/ssr.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
      {
        "<leader>sR",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },
  {
    "tpope/vim-projectionist",
    event = "BufRead",
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
    end,
    keys = {
      { "ga", "<cmd>A<CR>", desc = "Alternate file" },
    },
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
    end,
    keys = {
      {
        "<leader>rr",
        function()
          require("refactoring").select_refactor()
        end,
        mode = { "n", "x" },
        desc = "Refactor",
      },
    },
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
