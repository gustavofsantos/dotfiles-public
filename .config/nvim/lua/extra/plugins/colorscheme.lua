return {
  -- {
  --   "gustavofsantos/solarized.nvim",
  --   priority = 1000,
  --   enabled = true,
  --   config = function()
  --     require("solarized").setup()
  --     vim.cmd([[colorscheme solarized]])
  --   end,
  -- },
  {
    dir = "~/Code/solarized.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("solarized").setup()
      vim.cmd([[colorscheme solarized]])
    end,
  },
  {
    dir = "~/Code/noir.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      -- require("noir").setup()
      vim.cmd([[colorscheme noir]])
    end,
  },
  {
    dir = "~/Code/houston.nvim",
    priority = 1000,
    enabled = false,
    opts = {},
    config = function()
      vim.cmd([[set background=dark]])
      vim.cmd([[colorscheme houston]])
    end,
  },
  {
    dir = "~/Code/jellybeans.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("jellybeans").setup()
      vim.cmd([[colorscheme jellybeans]])
    end,
  },
  {
    dir = "~/Code/jb.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("jb").setup()
      vim.cmd([[colorscheme jb]])
    end,
  },
  {
    dir = "~/Code/overnight.nvim",
    priority = 1000,
    enabled = false,
    opts = {},
    config = function()
      vim.cmd([[colorscheme overnight]])
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    opts = {},
    init = function()
      vim.cmd("set background=light")
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "metalelf0/jellybeans-nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("kanagawa").setup({
        dimInactive = false,
        globalStatus = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true, bold = true },
        keywordStyle = { italic = true },
        statementStyle = { italic = true, bold = true },
        typeStyle = { italic = true },
        variablebuiltinStyle = { italic = true },
        transparent = false,
        background = {
          dark = "wave",
          light = "lotus",
        },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          -- only override the colors if the background is not light
          if vim.o.background == "light" then
            return {}
          end

          return {
            -- Normal = { bg = colors.palette.sumiInk0 },
            -- NormalNC = { bg = bg_color }
            Constant = { fg = colors.palette.fujiWhite },

            StatusLine = { bg = colors.palette.sumiInk4 },
            StatusLineNC = { bg = colors.palette.sumiInk2 },
            ColorColumn = { bg = colors.palette.sumiInk2 },

            PmenuSel = { fg = "NONE", bg = colors.theme.diff.text },

            TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },

            ["@type"] = { italic = false, bold = true },
            ["@tag"] = { italic = false },
            ["@tag.delimiter"] = { fg = colors.palette.sumiInk6 },
            ["@tag.attribute"] = { italic = true },
            ["@punctuation.bracket"] = { fg = colors.palette.sumiInk6 },
            ["@conditional.ternary"] = { fg = colors.palette.oniViolet, italic = false },
          }
        end,
      })
    end,
    init = function()
      vim.cmd("set background=light")
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      local bg = vim.o.background
      local palette = require("gruvbox").palette

      require("gruvbox").setup({
        terminal_colors = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = true,
        },
        contrast = "",
        dim_inactive = false,
        transparent_mode = false,
        overrides = {
          SignColumn = { bg = palette.dark0 },
          Function = { fg = palette.bright_green, italic = true, bold = false },
          ["@property"] = {
            fg = bg == "dark" and palette.bright_blue or palette.faded_blue,
            italic = true,
            bold = false,
          },
          ["@field"] = { link = "@property" },
          ["@keyword"] = {
            fg = bg == "dark" and palette.bright_purple or palette.faded_purple,
            italic = true,
            bold = false,
          },
          ["@boolean"] = {
            fg = bg == "dark" and palette.bright_purple or palette.faded_purple,
            italic = false,
            bold = true,
          },
          ["@punctuation.delimiter"] = { fg = palette.gray },
          ["@punctuation.bracket"] = { fg = palette.gray },
          ["@tag.delimiter"] = { fg = palette.gray },
          ["@lsp.type.parameter"] = { fg = palette.light1 },
          ["@lsp.type.property"] = { link = "@property" },
        },
      })

      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
