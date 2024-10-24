return {
  { "cocopon/iceberg.vim" },
  { "aktersnurra/no-clown-fiesta.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  { "vague2k/vague.nvim" },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        bold_vert_split = false,          -- use bold vertical separators
        dim_nc_background = false,        -- dim 'non-current' window backgrounds
        disable_background = true,        -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false,          -- disable italics
      }
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    },
  },
  {
    "maxmx03/solarized.nvim",
    opts = {
      styles = {
        comments = { italic = true, bold = false },
        functions = { italic = false },
        variables = { italic = false },
        numbers = {},
        constants = { bold = true },
        parameters = {},
        keywords = { italic = false, bold = true },
        types = {},
      },
      highlights = function(colors, colorhelper)
        local darken = colorhelper.darken
        local lighten = colorhelper.lighten

        local is_dark = vim.o.background == "dark"
        local cursor_line_bg = is_dark and darken(colors.base03, 100) or lighten(colors.base3, 100)
        local editor_bg = is_dark and darken(colors.base03, 25) or colors.base3

        return {
          Normal = { bg = editor_bg },
          LineNr = { fg = colors.base00, bg = colors.base03 },
          CursorLineNr = { fg = colors.yellow, bg = cursor_line_bg },
        }
      end,
    },
  },
  {
    "metalelf0/jellybeans-nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({})
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      require("nordic").setup({})
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    enabled = true,
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

          vim.api.nvim_set_hl(0, "NeotestPassed", { fg = colors.theme.diff.add })
          vim.api.nvim_set_hl(0, "NeotestRunning", { fg = colors.theme.diff.text })
          vim.api.nvim_set_hl(0, "NeotestFailed", { fg = colors.theme.diff.delete })


          return {
            Constant = { fg = colors.palette.fujiWhite },

            StatusLine = { bg = colors.palette.sumiInk4 },
            StatusLineNC = { bg = colors.palette.sumiInk2 },
            ColorColumn = { bg = colors.palette.sumiInk2 },

            -- DiagnosticWarn = { link = "LineNr" },
            -- DiagnosticInfo = { link = "LineNr" },
            -- DiagnosticHint = { link = "LineNr" },
            -- DiagnosticSignWarn = { link = "LineNr" },
            -- DiagnosticSignInfo = { link = "LineNr" },
            -- DiagnosticSignHint = { link = "LineNr" },

            TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },

            -- NeotestPassed = { fg = colors.theme.diff.add },
            -- NeotestRunning = { fg = colors.theme.diff.text },
            -- NeotestFailed = { fg = colors.theme.diff.delete },
            -- NeotestSkipped
            -- NeotestTest
            -- NeotestNamespace
            -- NeotestFocused
            -- NeotestFile
            -- NeotestDir
            -- NeotestBorder
            -- NeotestIndent
            -- NeotestExpandMarker
            -- NeotestAdapterName
            -- NeotestWinSelect
            -- NeotestMarked
            -- NeotestTarget

            Pmenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
            PmenuSbar = { bg = colors.theme.ui.bg_m1 },
            PmenuThumb = { bg = colors.theme.ui.bg_p2 },

            ["@type"] = { italic = false, bold = true },
            ["@tag"] = { italic = false },
            ["@tag.delimiter"] = { fg = colors.palette.sumiInk6 },
            ["@tag.attribute"] = { italic = true },
            ["@punctuation.bracket"] = { fg = colors.palette.sumiInk6 },
            ["@conditional.ternary"] = { fg = colors.palette.oniViolet, italic = false },
            ["@string.documentation.python"] = { link = "Comment" },
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
    enabled = false,
    init = function()
      vim.cmd([[let g:gruvbox_material_background = 'hard']])
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
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

      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
}
