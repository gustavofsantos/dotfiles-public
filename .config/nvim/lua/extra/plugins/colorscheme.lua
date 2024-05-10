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
  "ronisbr/nano-theme.nvim",
  "loctvl842/monokai-pro.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  "kvrohit/rasmus.nvim",
  "roobert/palette.nvim",
  {
    dir = "~/Code/solarized.nvim",
    enabled = true,
  },
  {
    "miikanissi/modus-themes.nvim",
    -- priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("modus_vivendi")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("nordic").setup({})
    end,
    init = function()
      -- vim.cmd.colorscheme("nordic")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        dimInactive = false,
        globalStatus = true,
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = false },
        statementStyle = { italic = false },
        typeStyle = { italic = true },
        variablebuiltinStyle = { italic = false },
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
            Constant = { fg = colors.palette.fujiWhite },

            StatusLine = { bg = colors.palette.sumiInk4 },
            StatusLineNC = { bg = colors.palette.sumiInk2 },
            ColorColumn = { bg = colors.palette.sumiInk2 },

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
      -- vim.cmd("set background=light")
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.cmd([[let g:gruvbox_material_background = 'hard']])
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
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
        contrast = "hard",
        dim_inactive = false,
        transparent_mode = false,
        overrides = {
          -- SignColumn = { bg = palette.dark0 },
          -- Function = { fg = palette.bright_green, italic = true, bold = false },
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
    end,
    init = function()
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
}
