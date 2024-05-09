return {
  "tpope/vim-sleuth",
  "mbbill/undotree",
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
    enabled = true,
    config = function()
      require("copilot").setup({
        filetypes = {
          lua = true,
          shell = true,
          sh = true,
          yaml = true,
          ["*"] = false,
        },
        suggestion = { enabled = true, auto_trigger = true, debounce = 200 },
        panel = { enabled = true, auto_refresh = true },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nix-profile/bin/node",
      })
    end,
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
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure" },
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end,
      },
    },
    config = function(_, opts)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()

      vim.api.nvim_create_autocmd("DiagnosticChanged", {
        pattern = { "conjure-log-*" },
        callback = function(args)
          local diagnostics = args.data.diagnostics

          if diagnostics[1] ~= nil then
            local bufnr = diagnostics[1]["bufnr"]
            local namespace = diagnostics[1]["namespace"]
            vim.diagnostic.disable(bufnr)
            vim.diagnostic.reset(namespace, bufnr)
          end
        end,
      })
    end,
    init = function()
      -- Set configuration options here
      vim.g["conjure#debug"] = true
    end,
  },
}
