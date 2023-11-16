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
    enabled = true,
    config = function()
      require("solarized").setup()
      vim.cmd([[colorscheme solarized]])
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
          return {
            -- Normal = { bg = colors.palette.sumiInk0 },
            -- NormalNC = { bg = bg_color }
            Constant = { fg = colors.palette.fujiWhite },

            StatusLine = { bg = colors.palette.sumiInk4 },
            StatusLineNC = { bg = colors.palette.sumiInk2 },
            ColorColumn = { bg = colors.palette.sumiInk2 },

            NvimTreeGitDirty = { fg = colors.palette.oniViolet },
            NvimTreeGitStaged = { fg = colors.palette.oniViolet },
            NvimTreeGitMerge = { fg = colors.palette.oniViolet },
            NvimTreeGitRenamed = { fg = colors.palette.oniViolet },
            NvimTreeGitNew = { fg = colors.palette.oniViolet },
            NvimTreeGitDeleted = { fg = colors.palette.oniViolet },
            NvimTreeFolderName = { fg = colors.palette.fujiGray },
            NvimTreeOpenedFolderName = { fg = colors.palette.fujiGray },
            NvimTreeRootFolder = { fg = colors.palette.fujiGray, italic = true },
            NvimTreeSpecialFile = { underline = true, italic = true, fg = colors.palette.fujiGray },
            NvimTreeNormalFloat = { bg = colors.theme.ui.bg },
            NvimTreeCursorLine = { bg = colors.palette.sumiInk5 },
            NvimTreeIndentMarker = { fg = colors.palette.fujiGray },

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

      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
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
