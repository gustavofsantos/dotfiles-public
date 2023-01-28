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
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = { bold = true },
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
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "frappe",
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
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = { "italic" },
        numbers = { "bold" },
        booleans = { "bold" },
        properties = { "italic" },
        types = { "bold" },
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
    },
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
