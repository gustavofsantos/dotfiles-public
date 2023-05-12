local has_solarized, solarized = pcall(require, 'solarized')
if has_solarized then
  solarized:setup {
    config = {
      theme = 'vim',
      transparent = false
    },
    highlights = function(colors, darken, lighten, blend)
      return {
        ["@variable"] = colors.base00
      }
    end
  }
end

local has_nordic, _ = pcall(require, 'nordic')
if has_nordic then
  require('nordic').setup({
    theme = 'onedark',
    telescope = {
      style = 'flat'
    }
  })
end

local has_monokai_pro, _ = pcall(require, 'monokai-pro')
if has_monokai_pro then
  require('monokai-pro').setup({
    transparent_background = true,
    devicons = true,
    styles = {
      comment = { italic = true },
      keyword = { italic = true }, -- any other keyword
      type = { bold = true }, -- (preferred) int, long, char, etc
      storageclass = { italic = true }, -- static, register, volatile, etc
      structure = { italic = true }, -- struct, union, enum, etc
      parameter = { }, -- parameter pass in function
      annotation = { italic = true },
      tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
    -- Enable this will disable filter option
    day_night = {
      enable = true, -- turn off by default
      day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    },
    background_clear = {
      -- "float_win",
      "toggleterm",
      "telescope",
      "which-key",
      "renamer"
    },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
    plugins = {
      bufferline = {
        underline_selected = false,
        underline_visible = false,
      },
    }
  })
end

local has_kanagawa, _ = pcall(require, 'kanagawa')
if has_kanagawa then
  local DARK_BLUE = "#0f111a"
  local PINK = "#af73c8"
  local RED = "#EF4444"
  local GRAY = "#b2b2b2"
  require('kanagawa').setup {
    dimInactive = false,
    globalStatus = true,
    commentStyle = { italic = true },
    functionStyle = { italic = true, bold = true },
    keywordStyle = { italic = true},
    statementStyle = { italic = true, bold = true },
    typeStyle = { italic = true },
    variablebuiltinStyle = { italic = true},
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            bg = DARK_BLUE,
          },
        },
      },
    },
    overrides = function (colors)
      return {
        StatusLine = { fg = colors.palette.fujiGray, bg = colors.theme.ui.bg },
        StatusLineNC = { fg = colors.palette.fujiGray, bg = colors.theme.ui.bg },

        NvimTreeGitDirty = { fg = PINK },
        NvimTreeGitStaged = { fg = PINK },
        NvimTreeGitMerge = { fg = PINK },
        NvimTreeGitRenamed = { fg = PINK },
        NvimTreeGitNew = { fg = PINK },
        NvimTreeGitDeleted = { fg = PINK },
        NvimTreeFolderName = { fg = GRAY },
        NvimTreeOpenedFolderName = { fg = GRAY },
        NvimTreeRootFolder = { fg = GRAY, italic = true },
        NvimTreeSpecialFile = { underline = true, italic = true, fg = GRAY },
        NvimTreeNormalFloat = { bg = DARK_BLUE },
        NvimTreeCursorLine = { bg = DARK_BLUE },
        NvimTreeIndentMarker = { fg = GRAY },
      }
    end
  }
end

local has_catppuccin, catppuccin = pcall(require, 'catppuccin')
if has_catppuccin then
  catppuccin.setup {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
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
      latte = {
        rosewater = "#FFAB91",
        flamingo = "#FFAB91",
        pink = "#673AB7",
        mauve = "#673AB7",
        red = "#EF5350",
        maroon = "#FFAB91",
        peach = "#FF6F00",
        yellow = "#E2C12F",
        green = "#66BB6A",
        teal = "#4DB5BD",
        sky = "#26C6DA",
        sapphire = "#005478",
        blue = "#42A5F5",
        lavender = "#673AB7",

        text = "#37474F",
        subtext1 = "#263238",
        subtext0 = "#90A4AE",
        overlay2 = "#7C7F93",
        overlay1 = "#8C8FA1",
        overlay0 = "#9CA0B0",
        surface2 = "#ACB0BE",
        surface1 = "#BCC0CC",
        surface0 = "#CCD0DA",

        base = "#FFFFFF",
        mantle = "#FAFAFA",
        crust = "#ECEFF1",
      },
      mocha = {
        base = "#111113", -- default bg
        mantle = "#0F0F11", -- darker bg
        crust = "#001122", -- darkest bg

        surface2 = "#637777", -- default comment
        surface1 = "#637777", -- darker comment
        surface0 = "#637777", -- darkest comment

        -- overlay2 = "#001122", -- popup fg, symbols
        overlay1 = "#8BADC1", -- conceal color
        overlay0 = "#102034", -- fold color

        subtext1 = "#8BADC1", -- indicator
        subtext0 = "#8BADC1", -- float title

        text = "#fefce8", -- text fg
        lavender = "#B4BEFE", -- cursor line number
        blue = "#82AAFF", -- diff changed
        sapphire = "#74C7EC", -- constructor
        sky = "#7fdbca", -- operator
        teal = "#CAECE6", -- hint
        green = "#addb67", -- diff add
        yellow = "#FAF39F", -- warning
        peach = "#ffcb8b", -- number
        maroon = "#EBA0AC", -- lighter red
        red = "#FF5874", -- error
        mauve = "#C792EA", -- tag
        pink = "#F5C2E7", -- pink or #BAEBE2
        flamingo = "#F2CDCD", -- target word
        rosewater = "#F5E0DC", -- winbar
      },
    },
    highlight_overrides = {
      latte = function (cp)
        return {
          TabLineFill = { fg = cp.subtext0, bg = cp.crust },
          TabLineSel = { fg = cp.text, bg = cp.base },
          StatusLine = { fg = cp.base, bg = cp.text },
          StatusLineNC = { fg = cp.crust, bg = cp.subtext0 },

          -- gitsigns.nvim
          GitSignsAdd = { fg = cp.green },
          GitSignsChange = { fg = cp.blue },
          GitSignsDelete = { fg = cp.red },

          ["@include"] = { fg = cp.lavender, style = {"italic"}},
          ["@boolean"] = { fg = cp.flamingo, style = { "bold" }},
          ["@string"] = { fg = cp.green },
          ["@variable"] = { fg = cp.text },
          ["@parameter"] = { fg = cp.text },
          ["@function"] = { fg = cp.subtext1 },
          ["@function.call"] = { fg = cp.subtext1, style = {"italic"} },
          ["@constant"] = { fg = cp.subtext1, style = { "bold" }},
          ["@constant.builtin"] = { fg = cp.flamingo, style = { "bold" }},
          ["@keyword"] = { fg = cp.lavender, style = { "italic" }},
          ["@keyword.return"] = { fg = cp.lavender, style = { "italic" }},
          ["@keyword.operator"] = { fg = cp.lavender, style = { "italic" }},
          ["@variable.builtin"] = { fg = cp.lavender, style = { "italic" }},
          ["@property"] = { fg = cp.text },
          ["@constructor"] = { fg = cp.text, style = { "italic", "bold" }},
          ["@method"] = { fg = cp.subtext1, style = { "italic" }},
          ["@method.call"] = { fg = cp.text, style = { "italic" }},
          ["@comment"] = { fg = cp.subtext0, style = {"italic"}},
          ["@operator"] = { fg = cp.subtext0 },
          ["@conditional"] = { fg = cp.lavender },
          ["@type"] = { fg = cp.subtext1, style = { "bold" }},
          ["@tag"] = { fg = cp.subtext1 },
          ["@tag.delimiter"] = { fg = cp.subtext0 },
          ["@tag.attribute"] = { fg = cp.text, style = { "italic" }},
          ["@punctuation.delimiter"] = { fg = cp.subtext0, },
          ["@punctuation.bracket"] = { fg = cp.subtext0 },
          ["@punctuation.special"] = { fg = cp.subtext0 },

          ["@field.yaml"] = { fg = cp.text, style = { "bold" }},
          ["@string.yaml"] = { fg = cp.flamingo, style = { "italic" }},
          ["@boolean.yaml"] = { fg = cp.lavender, style = {}}
        }
      end,
      mocha = function (cp)
        return {
          LineNr = { fg = "#506379" },
          CursorLineNr = { fg = "#CAE3FD", bg = cp.mantle },
          MatchParen = { fg = "#929AA3", bg = cp.surface1 },
          Folded = { bg = "#041F34" },
          TabLine = { fg = "#506379", bg = cp.crust },
          VertSplit = { fg = cp.surface2, bg = cp.crust },
          TabLineFill = { bg = cp.crust },
          TabLineSel = { fg = "#CAE3FD" , bg = cp.base },
          Visual = { fg = cp.text, bg = cp.surface2, style = {} },
          VisualNOS = { bg = "#041F34", style = {} },
          Comment = { fg = cp.surface2, style = { "italic" } },

          -- ["@operator"] = { fg = "#D8DBE0" },
          ["@punctuation.delimiter"] = { fg = "#475260", },
          ["@punctuation.bracket"] = { fg = "#506379", },
          ["@punctuation.special"] = { fg = cp.surface2 },
          ["@symbol"] = { fg = cp.surface1 },

          ["@comment"] = { fg = cp.surface2, style = { "italic" } },
          ["@string"] = { fg = "#ECC48D" },
          ["@boolean"] = { fg = cp.red, style = { "bold" } },
          ["@number"] = { link = "Number" },
          ["@float"] = { link = "Number" },

          ["@type"] = { fg = cp.text },
          ["@namespace"] = { fg = cp.text },
          ["@field"] = { fg = cp.text },
          ["@property"] = { fg = cp.teal },
          ["@function"] = { fg = cp.blue },
          ["@function.builtin"] = { fg = cp.green },

          ["@keyword"] = { fg = cp.sky, style = { "italic" }},
          ["@keyword.return"] = { fg = cp.sky, style = { "italic" }},
          ["@keyword.operator"] = { fg = cp.sky, style = { "italic" }},
          ["@keyword.export"] = { fg = cp.sky, style = { "italic" } },

          ["@conditional.ternary"] = { style = {} },

          ["@constructor"] = { fg = cp.teal },
          ["@parameter"] = { fg = cp.text },

          ["@method"] = { fg = cp.blue },
          ["@method.call"] = { fg = cp.blue },

          ["@tag"] = { fg = cp.peach },
          ["@tag.attribute"] = { fg = cp.green },
          ["@tag.delimiter"] = { fg = cp.rosewater },
          ["@tag.tsx"] = { fg = cp.teal },
          ["@tag.attribute.tsx"] = { fg = cp.green },
          ["@tag.delimiter.tsx"] = { fg = cp.sky },

          ["@include"] = { fg = cp.sky, style = { "italic" } },
          ["@import_identifier"] = { fg = cp.surface2 },
          ["@import_path"] = { fg = cp.surface2 },

          ["@constructor.lua"] = { fg = cp.surface1 },

          ["@field.yaml"] = { fg = cp.sky }
        }
      end,
    }
  }
end
