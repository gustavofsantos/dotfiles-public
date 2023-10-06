if vim.o.background ~= "dark" then
  return
end

vim.cmd("highlight clear")
vim.g.colors_name = "blue"

local colors = {
  bg = "#183752",
  bg_lighter = "#214462",
  border = "#3d5569",
  fg = "#bbd5ed",

  -- tokens
  keyword = "#e5ce5c",
  variable = "#ecf3ff",
  func = "#ecf3ff",
  type = "#ebf3ff",
  number = "#e5ce5c",
  boolean = "#e5ce5c",
  string = "#e5dcb4",
  comment = "#5c7a9c",
  operator = "#e5dcb4",
  delimiter = "#62799c",
  selection = "#4C6A88",
  special = "#e5dcb4",
  property = "#86b7fc",

  error = "#DE6826",
  success = "#7AB57B",

  -- version control
  add = "#99ad6a",
  change = "#8fbfdc",
  delete = "#902020",

  -- Special
  none = "NONE",

  -- Normal
  black = "#1c1c1c",
  red = "#ff968c",
  green = "#799d6a",
  yellow = "#ffb964",
  blue = "#8197bf",
  magenta = "#de9bc8",
  cyan = "#7bb099",
  white = "#d1d1d1",
  orange = "#cf6a4c",
  teal = "#668799",
  pink = "#f0a0c0",
  old_red = "#40000a",
  -- Bright
  bright_black = "#333333",
  bright_red = "#ffafa5",
  bright_green = "#99ad6a",
  bright_yellow = "#fad07a",
  bright_blue = "#8fbfdc",
  bright_magenta = "#c6b6ee",
  bright_cyan = "#94c9b2",
  bright_white = "#eaeaea",
  bright_old_red = "#902020",
  -- Dark
  dark_pink = "#302028",
  -- Grays
  gray01 = "#222221",
  gray02 = "#2a2a29",
  gray03 = "#384048",
  gray04 = "#535d66",
  gray05 = "#9098A0",
  gray06 = "#a0a8b0",
  gray07 = "#c7c7c7",
  gray08 = "#605958",
  gray09 = "#ccc5c4",
  gray10 = "#404040",
}

local hi = vim.api.nvim_set_hl

hi(0, "Normal", { fg = colors.fg, bg = colors.bg })
hi(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
hi(0, "SignColumn", { fg = colors.fg, bg = colors.bg })
hi(0, "EndOfBuffer", { fg = colors.bg_lighter })
hi(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_lighter })
hi(0, "FloatBorder", { fg = colors.border, bg = colors.bg_lighter })
hi(0, "ColorColumn", { fg = colors.none, bg = colors.bg_lighter })
hi(0, "Conceal", { fg = colors.bg_lighter })
hi(0, "Cursor", { fg = colors.bg, bg = colors.fg })
hi(0, "CursorIM", { fg = colors.bg, bg = colors.fg })
hi(0, "CursorLineNr", { fg = colors.variable })
hi(0, "LineNr", { fg = colors.comment })
hi(0, "Directory", { fg = colors.blue, bg = colors.none, bold = true })
hi(0, "DiffAdd", { fg = colors.bg, bg = colors.add })
hi(0, "DiffChange", { fg = colors.bg, bg = colors.change })
hi(0, "DiffDelete", { fg = colors.bg, bg = colors.delete })
hi(0, "DiffText", { fg = colors.fg, bg = colors.none })
hi(0, "ErrorMsg", { fg = colors.error })
hi(0, "Folded", { fg = colors.fg, bg = colors.bg_lighter, italic = true })
hi(0, "FoldColumn", { fg = colors.fg, bg = colors.bg_lighter })
hi(0, "IncSearch", { reverse = true })
hi(0, "MatchParen", { fg = colors.fg })
hi(0, "ModeMsg", { fg = colors.cyan, bold = true })
hi(0, "MoreMsg", { fg = colors.cyan, bold = true })
hi(0, "NonText", { fg = colors.gray03 })
hi(0, "Pmenu", { fg = colors.fg, bg = colors.bg_lighter })
hi(0, "PmenuSel", { fg = colors.variable, bg = colors.border })
hi(0, "PmenuSbar", { fg = colors.variable, bg = colors.bg_lighter })
hi(0, "PmenuThumb", { fg = colors.fg, bg = colors.gray05 })
hi(0, "Question", { fg = colors.green, bold = true })
hi(0, "QuickFixLine", { fg = colors.blue, bg = colors.gray01, bold = true, italic = true })
hi(0, "qfLineNr", { fg = colors.comment })
hi(0, "Search", { reverse = true })
hi(0, "SpecialKey", { fg = colors.gray03 })
hi(0, "SpellBad", { fg = colors.red, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellCap", { fg = colors.blue, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellLocal", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellRare", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "StatusLine", { fg = colors.bg, bg = colors.comment })
hi(0, "StatusLineNC", { fg = colors.comment, bg = colors.bg_lighter })
hi(0, "StatusLineTerm", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "StatusLineTermNC", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "TabLineFill", { fg = colors.fg, bg = colors.bg_ligher })
hi(0, "TablineSel", { fg = colors.variable, bg = colors.bg })
hi(0, "Tabline", { fg = colors.fg, bg = colors.bg_lighter })
hi(0, "Title", { fg = colors.cyan, bg = colors.none, bold = true })
hi(0, "Visual", { bg = colors.selection })
hi(0, "VisualNOS", { bg = colors.selection })
hi(0, "WarningMsg", { fg = colors.yellow, bold = true })
hi(0, "WildMenu", { fg = colors.bg, bg = colors.bg_lighter, bold = true })
hi(0, "CursorColumn", { fg = colors.none, bg = colors.gray02 })
hi(0, "CursorLine", { bg = colors.border })
hi(0, "ToolbarLine", { fg = colors.fg, bg = colors.gray01 })
hi(0, "ToolbarButton", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "NormalMode", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "InsertMode", { fg = colors.green, bg = colors.none, reverse = true })
hi(0, "VisualMode", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "VertSplit", { fg = colors.border })
hi(0, "CommandMode", { fg = colors.gray05, bg = colors.none, reverse = true })
hi(0, "Warnings", { fg = colors.yellow })
hi(0, "Type", { fg = colors.type })
hi(0, "StorageClass", { fg = colors.type })
hi(0, "Structure", { fg = colors.fg })
hi(0, "Constant", { fg = colors.variable })
hi(0, "Comment", { fg = colors.comment, bold = false, italic = true })
hi(0, "Conditional", { fg = colors.keyword, bg = colors.none, bold = false, italic = false })
hi(0, "Keyword", { fg = colors.keyword, bg = colors.none, bold = false, italic = true })
hi(0, "Repeat", { fg = colors.keyword, bg = colors.none, bold = false, italic = false })
hi(0, "Boolean", { fg = colors.boolean, bg = colors.none, bold = true, italic = false })
hi(0, "Function", { fg = colors.func, bg = colors.none, bold = false, italic = true })
hi(0, "Identifier", { fg = colors.fg, bg = colors.none })
hi(0, "String", { fg = colors.string })
hi(0, "StringDelimiter", { fg = colors.delimiter })
hi(0, "Character", { fg = colors.cyan })
hi(0, "Number", { fg = colors.number })
hi(0, "Float", { fg = colors.number })
hi(0, "Statement", { fg = colors.keyword })
hi(0, "Label", { fg = colors.cyan })
hi(0, "Operator", { fg = colors.operator })
hi(0, "Exception", { fg = colors.keyword })
hi(0, "PreProc", { fg = colors.keyword })
hi(0, "Include", { fg = colors.keyword, italic = true })
hi(0, "Define", { fg = colors.keyword })
hi(0, "Macro", { fg = colors.keyword })
hi(0, "Typedef", { fg = colors.keyword })
hi(0, "PreCondit", { fg = colors.keyword })
hi(0, "Special", { fg = colors.special, bold = true })
hi(0, "SpecialChar", { fg = colors.cyan })
hi(0, "Tag", { fg = colors.type })
hi(0, "Delimiter", { fg = colors.delimiter })
hi(0, "SpecialComment", { fg = colors.fg })
hi(0, "Debug", { fg = colors.red })
hi(0, "Underlined", { fg = colors.cyan, bg = colors.none, underline = true })
hi(0, "Ignore", { fg = colors.gray07 })
hi(0, "Error", { fg = colors.error, bg = colors.none, bold = true, underline = true })
hi(0, "Todo", { fg = colors.cyan, bg = colors.none, bold = true, italic = true })

-- Telescope
hi(0, "TelescopeSelectionCaret", { fg = colors.keyword })
hi(0, "TelescopeBorder", { fg = colors.border })
hi(0, "TelescopePromptBorder", { fg = colors.border })
hi(0, "TelescopeResultsBorder", { fg = colors.border })
hi(0, "TelescopePreviewBorder", { fg = colors.border })
hi(0, "TelescopeMatching", { fg = colors.string })
hi(0, "TelescopePromptPrefix", { fg = colors.blue })

-- Sneak
hi(0, "Sneak", { fg = colors.fg, bg = colors.keyword })
hi(0, "SneakScope", { bg = colors.keyword })

-- Diagnostics
hi(0, "DiagnosticError", { fg = colors.error })
hi(0, "DiagnosticWarn", { fg = colors.yellow })
hi(0, "DiagnosticInfo", { fg = colors.property })
hi(0, "DiagnosticHint", { fg = colors.property })
hi(0, "DiagnosticUnderlineError", { fg = colors.error, undercurl = true, sp = colors.red })
hi(0, "DiagnosticUnderlineWarn", { fg = colors.yellow, undercurl = true, sp = colors.yellow })
hi(0, "DiagnosticUnderlineInfo", { fg = colors.property, undercurl = true, sp = colors.blue })
hi(0, "DiagnosticUnderlineHint", { fg = colors.property, undercurl = true, sp = colors.cyan })

-- GitSigns
hi(0, "GitSignsAdd", { fg = colors.success })
hi(0, "GitSignsAddNr", { fg = colors.success })
hi(0, "GitSignsAddLn", { fg = colors.success })
hi(0, "GitSignsChange", { fg = colors.teal })
hi(0, "GitSignsChangeNr", { fg = colors.teal })
hi(0, "GitSignsChangeLn", { fg = colors.bright_yellow })
hi(0, "GitSignsDelete", { fg = colors.error })
hi(0, "GitSignsDeleteNr", { fg = colors.error })
hi(0, "GitSignsDeleteLn", { fg = colors.error })

-- Treesitter
hi(0, "@tag", { fg = colors.type, bold = true })
hi(0, "@tag.attribute", { fg = colors.property, italic = true })
hi(0, "@tag.delimiter", { fg = colors.delimiter })

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg
