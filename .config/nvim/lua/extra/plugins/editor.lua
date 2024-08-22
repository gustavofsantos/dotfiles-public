return {
  "tpope/vim-sleuth",
  "mbbill/undotree",
  { -- Move any selection in any direction
    -- Move up......................... <A-k>
    -- Move down....................... <A-j>
    -- Move left....................... <A-h>
    -- Move right...................... <A-l>
    "echasnovski/mini.move",
    event = "BufRead",
    opts = {},
  },
  { -- Go forward/backward with square brackets
    -- Buffer.......................... [B [b ]b ]B
    -- Comment block................... [C [c ]c ]C
    -- Conflict marker................. [X [x ]x ]X
    -- Diagnostic...................... [D [d ]d ]D
    -- File on disk.................... [F [f ]f ]F
    -- Indent change................... [I [i ]i ]I
    -- Jump from |jumplist|
    -- inside current buffer........... [J [j ]j ]J
    -- Location from |location-list|... [L [l ]l ]L
    -- Old files....................... [O [o ]o ]O
    -- Quickfix entry from |Quickfix|.. [Q [q ]q ]Q
    -- Tree-sitter node and parents.... [T [t ]t ]T
    -- Undo states from specially
    -- tracked linear history.......... [U [u ]u ]U
    -- Window in current tab........... [W [w ]w ]W
    -- Yank selection replacing
    -- latest put region................[Y [y ]y ]Y
    "echasnovski/mini.bracketed",
    event = "BufRead",
    opts = {}
  },
  { -- Highlight hex color strings (`#rrggbb`) using that color
    "echasnovski/mini.hipatterns",
    event = "BufRead",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    version = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-tree-docs",
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "clojure",
          "gitcommit",
          "git_rebase",
          "lua",
          "json",
          "toml",
          "rust",
          "ruby",
          "markdown",
          "markdown_inline",
          "javascript",
          "jsdoc",
          "typescript",
          "tsx",
          "python",
          "vim",
          "vimdoc",
          "css",
        },

        auto_install = true,

        highlight = {
          enable = true,
          -- use_languagetree = true,
          -- additional_vim_regex_highlighting = { "markdown" },
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
              ["]o"] = { query = { "@loop.inner", "@loop.outer" } },
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
              ["[o"] = { query = { "@loop.inner", "@loop.outer" } },
              ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = "none",
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
        context_commentstring = {
          enable = true,
        },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        tree_docs = { enable = true },
      })

      require("treesitter-context").setup({
        enable = false,
      })


      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

      -- vim.keymap.set("n", "<leader>tx", "<cmd>TSContextToggle<cr>", { noremap = true, silent = true })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    dependencies = {},
    version = "*",
    event = "BufEnter",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        shade_terminals = false,
        start_in_insert = false,
      })
    end,
  }
}
