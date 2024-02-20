return {
  "tpope/vim-sleuth",
  "mbbill/undotree",
  -- {
  --   "justinmk/vim-sneak",
  --   config = function()
  --     vim.cmd([[let g:sneak#label = 1]])
  --     vim.cmd([[let g:sneak#use_ic_scs = 1]])
  --   end,
  -- },
  {
    "AndrewRadev/switch.vim",
    config = function()
      vim.cmd([[let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(.*\)TODO\(.*\)$': '\1DOING\2',
    \     '^\(.*\)DOING\(.*\)$': '\1DONE\2',
    \     '^\(.*\)DONE\(.*\)$': '\1TODO\2',
    \     '^\(.*\)\[ \]\(.*\)$': '\1\[/\]\2',
    \     '^\(.*\)\[/\]\(.*\)$': '\1\[x\]\2',
    \     '^\(.*\)\[x\]\(.*\)$': '\1\[ \]\2',
    \     'it': 'fit',
    \     'fit': 'xit',
    \     'xit': 'it',
    \     'true': 'false',
    \     'false': 'true',
    \     'True': 'False',
    \     'False': 'True',
    \   }
    \ ]
]])
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {
      restriction_mode = "hint",
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
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
    keys = {
      { "ga", "<cmd>A<CR>", desc = "Alternate file" },
    },
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
        suggestion = { enabled = true, auto_trigger = true, debounce = 200 },
        panel = { enabled = true, auto_refresh = true },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.16.0/bin/node",
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufRead",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = true,
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
