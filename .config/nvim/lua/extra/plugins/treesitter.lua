---@diagnostic disable: missing-fields
return {
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
  end,
}
