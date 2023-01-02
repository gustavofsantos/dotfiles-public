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
    statementStyle = { bold = true },
    typeStyle = { italic = true },
    variablebuiltinStyle = { italic = true},
  }
end

local has_gruvbox, gruvbox = pcall(require, "gruvbox")
if has_gruvbox then
  gruvbox.setup({
    contrast = "hard",
    dim_inactive = true,
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
      functions = { bold = true }
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
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    dim_inactive = {
        enabled = true,
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
        numbers = {},
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
