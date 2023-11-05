---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  version = false,
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        "gitcommit",
        "git_rebase",
        "bash",
        "go",
        "lua",
        "http",
        "json",
        "proto",
        "toml",
        "rust",
        "haskell",
        "markdown",
        "markdown_inline",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "prisma",
        "python",
        "vim",
        "elixir",
        "css",
        "eex",
        "heex",
        "svelte",
      },
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
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
      context_commentstring = {
        enable = false,
      },
    })

    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
    })
  end,
}
