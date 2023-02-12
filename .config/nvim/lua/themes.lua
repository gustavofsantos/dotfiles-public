local toggleterm = require "toggleterm"
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

local has_poimandres, poimandres = pcall(require, 'poimandres')
if has_poimandres then
  poimandres.setup {
    bold_vert_split = false, -- use bold vertical separators
    dim_nc_background = true, -- dim 'non-current' window backgrounds
    disable_background = false, -- disable background
    disable_float_background = false, -- disable background for floats
    disable_italics = false, -- disable italics
  }
end

local has_kanagawa, kanagawa = pcall(require, 'kanagawa')
if has_kanagawa then
  kanagawa.setup {
    dimInactive = true,
    globalStatus = true,
    commentStyle = { italic = true },
    functionStyle = { italic = true, bold = true },
    keywordStyle = { italic = true},
    statementStyle = { italic = true, bold = true },
    typeStyle = { italic = true },
    variablebuiltinStyle = { italic = true},
  }
end

local has_gruvbox, gruvbox = pcall(require, "gruvbox")
if has_gruvbox then
  gruvbox.setup({
    contrast = "",
    dim_inactive = true,
    invert_signs = true,
  })
end

local has_nightfox, nightfox = pcall(require, "nightfox")
if has_nightfox then
  nightfox.setup {
    options = {
      dim_inactive = false,
      transparent = false,
      styles = {
        comments = "italic",
        functions = "italic",
        conditionals = "italic",
        constants = "italic,bold",
        variables = "italic",
        numbers = "bold",
        keywords = "italic",
        types = "italic,bold"
      }
    }
  }
end

local has_tokyonight, tokyonight = pcall(require, "tokyonight")
if has_tokyonight then
  tokyonight.setup {
    style = "night",
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = { italic = true },
    },
    dim_inactive = true,
    lualine_bold = true
  }
end

local has_tundra, tundra = pcall(require, 'nvim-tundra')
if has_tundra then
  tundra.setup {
    syntax = {
      booleans = { bold = true, italic = true },
      comments = { bold = true, italic = true },
      conditionals = {},
      constants = { bold = true },
      functions = {},
      keywords = { italic = true },
      loops = {},
      numbers = { bold = true },
      operators = { bold = true },
      punctuation = {},
      strings = {},
      types = { italic = true },
    },
  }
end

local has_catppuccin, catppuccin = pcall(require, 'catppuccin')
if has_catppuccin then
  catppuccin.setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "frappe",
        dark = "mocha",
    },
    transparent_background = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = { "bold" },
        booleans = { "bold" },
        properties = { "italic" },
        types = { "bold" },
        operators = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = {
        enabled = true,
        show_root = false,
        transparent_panel = false,
      },
      telescope = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      toggleterm = {
        transparent_panel = false,
        transparent_background = false
      }
    },
    color_overrides = {
      mocha = {
        base = "#011627", -- default bg
        mantle = "#001122", -- darker bg
        crust = "#000C1D", -- darkest bg

        surface2 = "#637777", -- default comment
        surface1 = "#4B6174", -- darker comment
        surface0 = "#04111F", -- darkest comment

        -- overlay2 = "#001122", -- popup fg, symbols
        overlay1 = "#8BADC1", -- conceal color
        overlay0 = "#102034", -- fold color

        subtext1 = "#8BADC1", -- indicator
        subtext0 = "#8BADC1", -- float title

        text = "#D7DBE0", -- text fg
        lavender = "#B4BEFE", -- cursor line number
        blue = "#82AAFF", -- diff changed
        sapphire = "#74C7EC", -- constructor
        sky = "#7FDBCA", -- operator
        teal = "#CAECE6", -- hint
        green = "#C5E478", -- diff add
        yellow = "#FAF39F", -- warning
        peach = "#F78C6C", -- number
        maroon = "#EBA0AC", -- lighter red
        red = "#FF5874", -- error
        mauve = "#C792EA", -- tag
        pink = "#F5C2E7", -- pink or #BAEBE2
        flamingo = "#F2CDCD", -- target word
        rosewater = "#F5E0DC", -- winbar
      }
    },
    highlight_overrides = {
      mocha = function (cp)
        return {
          LineNr = { fg = "#506379" },
          CursorLineNr = { fg = "#CAE3FD" },
          MatchParen = { fg = "#929AA3", bg = cp.surface1 },

          -- ["@operator"] = { fg = "#D8DBE0" },
          ["@punctuation.delimiter"] = { fg = "#475260", },
          ["@punctuation.bracket"] = { fg = "#506379", },
          ["@punctuation.special"] = { fg = cp.surface2 },
          ["@symbol"] = { fg = cp.surface1 },

          ["@string"] = { fg = "#ECC48D" },
          ["@boolean"] = { fg = cp.red, style = { "bold" } },
          ["@number"] = { link = "Number" },
          ["@float"] = { link = "Number" },

          ["@field"] = { fg = cp.text },
          ["@property"] = { fg = cp.teal },

          ["@keyword.export"] = { fg = cp.mauve, style = { "italic" } },

          ["@conditional.ternary"] = { style = {} },

          ["@constructor"] = { fg = cp.sky },
          ["@parameter"] = { fg = cp.text },

          ["@method.call"] = { fg = cp.blue },

          ["@tag"] = { fg = cp.teal },
          ["@tag.attribute"] = { fg = cp.green },
          ["@tag.delimiter"] = { fg = cp.sky },

          ["@include"] = { fg = cp.subtext1, style = { "italic" } },
          ["@import_identifier"] = { fg = cp.surface2 },
          ["@import_path"] = { fg = cp.surface2 },

          ["@constructor.lua"] = { fg = cp.surface1 },
        }
      end
    }
  }
end

local has_onedarkpro, onedarkpro = pcall(require, 'onedarkpro')
if has_onedarkpro then
  onedarkpro.setup {
    styles = { -- For example, to apply bold and italic, use "bold,italic"
      types = "bold,italic", -- Style that is applied to types
      methods = "italic", -- Style that is applied to methods
      numbers = "bold", -- Style that is applied to numbers
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "italic", -- Style that is applied to keywords
      constants = "bold", -- Style that is applied to constants
      functions = "italic", -- Style that is applied to functions
      operators = "NONE", -- Style that is applied to operators
      variables = "NONE", -- Style that is applied to variables
      parameters = "NONE", -- Style that is applied to parameters
      conditionals = "NONE", -- Style that is applied to conditionals
      virtual_text = "NONE", -- Style that is applied to virtual text
    }
  }
end
