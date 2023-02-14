vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true


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
          Folded = { bg = "#041F34" },
          TabLine = { fg = "#506379", bg = cp.crust },
          TabLineFill = { bg = cp.crust },
          TabLineSel = { fg = "#CAE3FD" , bg = cp.base },
          Visual = { bg = "#041F34", style = {} },
          VisualNOS = { bg = "#041F34", style = {} },

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
          ["@tag.tsx"] = { fg = cp.teal },
          ["@tag.attribute.tsx"] = { fg = cp.green },
          ["@tag.delimiter.tsx"] = { fg = cp.sky },

          ["@include"] = { fg = cp.subtext1, style = { "italic" } },
          ["@import_identifier"] = { fg = cp.surface2 },
          ["@import_path"] = { fg = cp.surface2 },

          ["@constructor.lua"] = { fg = cp.surface1 },
        }
      end
    }
  }
end
