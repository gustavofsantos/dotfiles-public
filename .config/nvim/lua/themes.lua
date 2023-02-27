vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

vim.g.rasmus_italic_comments = true
vim.g.rasmus_italic_keywords = true
vim.g.rasmus_italic_functions = true
vim.g.rasmus_bold_booleans = true
vim.g.rasmus_bold_functions = true
vim.g.rasmus_transparent = false

vim.g.mellow_italic_comments = true
vim.g.mellow_italic_keywords = true
vim.g.mellow_italic_functions = true
vim.g.mellow_italic_variables = false
vim.g.mellow_bold_booleans = true
vim.g.mellow_transparent = false

vim.g.oh_lucy_italic_comments = true
vim.g.oh_lucy_italic_keywords = true
vim.g.oh_lucy_italic_booleans = false
vim.g.oh_lucy_italic_functions = true
vim.g.oh_lucy_italic_variables = false
vim.g.oh_lucy_transparent_background = false

local has_gruvbox, gruvbox = pcall(require, 'gruvbox')
if has_gruvbox then
  gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
      SignColumn = { bg = "#282828" },
      LineNr = { bg = "#282828" },
      CursorLineNr = { bg = "#282828" },
      ColorColumn = { bg = "#1d2021" },
      TabLine = { fg = "#928374", bg = "#1d2021" },
      TabLineFill = { fg = "#928374", bg = "#1d2021" },
      TabLineSel = { fg = "#fbf1c7" , bg = "#282828" },
      Operator = { italic = false },
      String = { italic = false },
      ["@boolean"] = { fg = "#d3869b", bold = true },
      ["@function.call"] = { fg = "#b8bb26", italic = true },
      ["@conditional"] = { fg = "#fb4934", italic = true },
      ["@keyword"] = { fg = "#fb4934", italic = true },
      ["@punctuation.special"] = { fg = "#3c3836" },
    },
    dim_inactive = false,
    transparent_mode = false,
  })
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
      },
      macchiato = {
        base = "#151515", -- default bg
        mantle = "#000000", -- darker bg
        crust = "#000000", -- darkest bg

        surface2 = "#6F6F6F", -- default comment
        surface1 = "#6F6F6F", -- darker comment
        surface0 = "#6F6F6F", -- darkest comment

        -- overlay2 = "#001122", -- popup fg, symbols
        overlay1 = "#8BADC1", -- conceal color
        overlay0 = "#1D2633", -- fold color

        subtext1 = "#8BADC1", -- indicator
        subtext0 = "#8BADC1", -- float title

        text = "#FFFFFF", -- text fg
        lavender = "#B4BEFE", -- cursor line number
        blue = "#7AD9FB", -- diff changed
        sapphire = "#A390FF", -- constructor
        sky = "#B3E8B4", -- operator
        teal = "#6F6F6F", -- hint
        green = "#CDF861", -- diff add
        yellow = "#EFFFA5", -- warning
        peach = "#7AD9FB", -- number
        maroon = "#E88E73", -- lighter red
        red = "#E88E73", -- error
        mauve = "#A390FF", -- tag
        pink = "#F5C2E7", -- pink or #BAEBE2
        flamingo = "#F2CDCD", -- target word
        rosewater = "#000000", -- winbar
      }
    },
    highlight_overrides = {
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

          -- ["@operator"] = { fg = "#D8DBE0" },
          ["@punctuation.delimiter"] = { fg = "#475260", },
          ["@punctuation.bracket"] = { fg = "#506379", },
          ["@punctuation.special"] = { fg = cp.surface2 },
          ["@symbol"] = { fg = cp.surface1 },

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

          ["@keyword.export"] = { fg = cp.mauve, style = { "italic" } },

          ["@conditional.ternary"] = { style = {} },

          ["@constructor"] = { fg = cp.teal },
          ["@parameter"] = { fg = cp.text },

          ["@method"] = { fg = cp.blue },
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

          ["@field.yaml"] = { fg = cp.sky }
        }
      end,
      macchiato = function (cp)
        return {
          LineNr = { fg = "#858585" },
          CursorLineNr = { fg = "#C6C6C6" },
          MatchParen = { fg = "#929AA3", bg = cp.surface1 },
          Folded = { bg = "#041F34" },
          TabLine = { fg = "#E5E5E5", bg = "#000000" },
          TabLineFill = { fg = "#506379", bg = cp.crust },
          TabLineSel = { fg = cp.text , bg = cp.base },
          Visual = { bg = "#252526", style = {} },
          VisualNOS = { bg = "#252526", style = {} },
          Number = { fg = "#7AD9FB" },

          ["@operator"] = { fg = cp.sky },
          ["@punctuation.delimiter"] = { fg = "#86897A", },
          ["@punctuation.bracket"] = { fg = "#86897A", },
          ["@punctuation.special"] = { fg = "#86897A" },
          ["@symbol"] = { fg = "#86897A" },

          ["@string"] = { fg = "#BFD084" },
          ["@boolean"] = { link = "Number" },
          ["@number"] = { link = "Number" },
          ["@float"] = { link = "Number" },
          ["@constant.builtin"] = { link = "Number" },

          ["@type"] = { fg = cp.text },
          ["@field"] = { fg = cp.text },
          ["@property"] = { fg = cp.text },
          ["@function"] = { fg = cp.text },

          ["@keyword.export"] = { fg = cp.mauve, style = { "italic" } },

          ["@conditional.ternary"] = { style = {} },

          ["@constructor"] = { fg = cp.sky },
          ["@parameter"] = { fg = cp.text },

          ["@method"] = { fg = cp.green },
          ["@method.call"] = { fg = cp.green },

          ["@tag"] = { fg = cp.mauve },
          ["@tag.attribute"] = { fg = "#CABEFF" },
          ["@tag.delimiter"] = { fg = "#475260" },
          ["@tag.tsx"] = { fg = cp.mauve  },
          ["@tag.attribute.tsx"] = { fg = "#CABEFF" },
          ["@tag.delimiter.tsx"] = { fg = "#475260" },

          ["@include"] = { fg = cp.mauve, style = { "italic" } },

          ["@constructor.lua"] = { fg = cp.surface1 },
        }
      end
    }
  }
end
