local treesitter = require('nvim-treesitter')
if (not treesitter) then return end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "json",
    "http",
    "norg",
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
  },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  context_commentstring = {
    enable = true
  }
}

require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
}
