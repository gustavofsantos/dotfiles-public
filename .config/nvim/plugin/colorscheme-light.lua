if vim.o.background ~= "light" then
    return
end

vim.cmd("highlight clear")
vim.g.colors_name = "gfs-light"

local colors = {
    bg = "#fafafa",
    fg = "#383940",

    popup_bg = "#ebeaed",
    cursor_line_bg = "#efeef1",

    -- Normal
    black = "#383940", -- ok
    red = "#d85a57", -- ok
    green = "#57a961", -- ok
    yellow = "#b48147", -- ok
    magenta = "#b437ad", -- ok
    blue = "#6b5fdd", -- ok
    cyan = "#4179b3", -- ok
    white = "#fafafa", -- ok

    -- Bright
    bright_black = "#a2a3a7", -- ok - commentaries
    bright_red = "#fddeda", -- ok
    bright_green = "#99ad6a",
    bright_yellow = "#dbc88e", -- ok
    bright_magenta = "#c6b6ee",
    bright_blue = "#cccdf1", -- ok - visual selection
    bright_cyan = "#94c9b2",
    bright_white = "#ffffff", -- ok

    -- Grays
    gray01 = "#222221",
    gray02 = "#2a2a29",
    gray03 = "#384048",
    gray04 = "#535d66",
    gray05 = "#cacaca", -- ok - autocomplete selected
    gray06 = "#83838a", -- ok
    gray07 = "#b8babc", -- ok
    gray08 = "#dfdfdf", -- ok - border
    gray09 = "#ebeaed", --ok - tabline bg
    match_paren_bg = "#ebebf7",

    -- Special
    none = "NONE",

    -- Normal
    orange = "#cf6a4c",
    teal = "#668799",
    pink = "#f0a0c0",
    old_red = "#40000a",
    -- Bright
    bright_old_red = "#902020",
    -- Dark
    dark_pink = "#302028",
    -- Grays
    gray10 = "#404040",
}

local hi = vim.api.nvim_set_hl

hi(0, "Normal", { fg = colors.fg, bg = colors.bg })
hi(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
hi(0, "SignColumn", { bg = colors.bg })
hi(0, "EndOfBuffer", { fg = colors.gray03 })
hi(0, "NormalFloat", { fg = colors.fg, bg = colors.gray08 })
hi(0, "FloatBorder", { fg = colors.blue, bg = colors.gray07 })
hi(0, "ColorColumn", { bg = colors.gray09 })
hi(0, "Conceal", { fg = colors.gray05 })
hi(0, "Cursor", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "CursorIM", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "Directory", { fg = colors.blue, bg = colors.none, bold = true })
hi(0, "DiffAdd", { bg = colors.bright_green })
hi(0, "DiffChange", { bg = colors.bright_blue })
hi(0, "DiffDelete", { bg = colors.bright_red })
hi(0, "DiffText", { fg = colors.fg, bg = colors.none, reverse = true })
hi(0, "ErrorMsg", { fg = colors.red, bg = colors.bright_red })
hi(0, "Folded", { fg = colors.bright_black, bg = colors.match_paren_bg, italic = true })
hi(0, "FoldColumn", { fg = colors.bright_black, bg = colors.match_paren_bg })
hi(0, "IncSearch", { bg = colors.bright_blue })
hi(0, "LineNr", { fg = colors.bright_black })
hi(0, "CursorLineNr", { fg = colors.fg })
hi(0, "MatchParen", { bg = colors.match_paren_bg })
hi(0, "ModeMsg", { fg = colors.cyan, bold = true })
hi(0, "MoreMsg", { fg = colors.cyan, bold = true })
hi(0, "NonText", { fg = colors.gray03 })
hi(0, "Pmenu", { fg = colors.fg, bg = colors.gray09 })
hi(0, "PmenuSel", { fg = colors.fg, bg = colors.gray08 })
hi(0, "PmenuSbar", { fg = colors.fg, bg = colors.gray08 })
hi(0, "PmenuThumb", { fg = colors.fg, bg = colors.gray08 })
hi(0, "Question", { fg = colors.green, bold = true })
hi(0, "QuickFixLine", { fg = colors.blue, bg = colors.gray01, bold = true, italic = true })
hi(0, "qfLineNr", { fg = colors.blue, bg = colors.gray01 })
hi(0, "Search", { bg = colors.match_paren_bg })
hi(0, "SpecialKey", { fg = colors.gray03 })
hi(0, "SpellBad", { fg = colors.red, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellCap", { fg = colors.blue, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellLocal", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellRare", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "StatusLine", { fg = colors.fg, bg = colors.gray09 })
hi(0, "StatusLineNC", { fg = colors.bright_black, bg = colors.gray09 })
hi(0, "StatusLineTerm", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "StatusLineTermNC", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "TabLineFill", { fg = colors.gray05, bg = colors.gray09 })
hi(0, "TablineSel", { fg = colors.fg, bg = colors.bg })
hi(0, "Tabline", { fg = colors.fg, bg = colors.gray09 })
hi(0, "Title", { fg = colors.cyan, bg = colors.none, bold = true })
hi(0, "Visual", { bg = colors.bright_blue })
hi(0, "VisualNOS", { bg = colors.bright_blue })
hi(0, "WarningMsg", { fg = colors.yellow, bold = true })
hi(0, "WildMenu", { fg = colors.bg, bg = colors.blue, bold = true })
hi(0, "CursorColumn", { fg = colors.none, bg = colors.gray02 })
hi(0, "CursorLine", { bg = colors.cursor_line_bg })
hi(0, "ToolbarLine", { fg = colors.fg, bg = colors.gray01 })
hi(0, "ToolbarButton", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "NormalMode", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "InsertMode", { fg = colors.green, bg = colors.bright_green, reverse = true })
hi(0, "VisualMode", { fg = colors.cyan, bg = colors.bright_cyan, reverse = true })
hi(0, "VertSplit", { fg = colors.gray08, bg = colors.bg })
hi(0, "CommandMode", { fg = colors.gray05, bg = colors.none, reverse = true })
hi(0, "Warnings", { fg = colors.yellow, bg = colors.bright_yellow })
hi(0, "Type", { fg = colors.cyan })
hi(0, "StorageClass", { fg = colors.cyan })
hi(0, "Structure", { fg = colors.fg })
hi(0, "Constant", { fg = colors.cyan })
hi(0, "Comment", { fg = colors.bright_black, bg = colors.none, bold = false, italic = true })
hi(0, "Conditional", { fg = colors.magenta, bg = colors.none, bold = false, italic = false })
hi(0, "Keyword", { fg = colors.magenta, bg = colors.none, bold = false, italic = true })
hi(0, "Repeat", { fg = colors.magenta, bg = colors.none, bold = false, italic = false })
hi(0, "Boolean", { fg = colors.orange, bg = colors.none, bold = true, italic = false })
hi(0, "Function", { fg = colors.blue, bg = colors.none, bold = false, italic = true })
hi(0, "Identifier", { fg = colors.fg, bg = colors.none })
hi(0, "String", { fg = colors.green, bg = colors.none })
hi(0, "StringDelimiter", { fg = colors.green, bg = colors.none })
hi(0, "Character", { fg = colors.green })
hi(0, "Number", { fg = colors.cyan })
hi(0, "Float", { fg = colors.cyan })
hi(0, "Statement", { fg = colors.blue })
hi(0, "Label", { fg = colors.cyan })
hi(0, "Operator", { fg = colors.fg })
hi(0, "Exception", { fg = colors.yellow })
hi(0, "PreProc", { fg = colors.red })
hi(0, "Include", { fg = colors.blue })
hi(0, "Define", { fg = colors.cyan })
hi(0, "Macro", { fg = colors.blue })
hi(0, "Typedef", { fg = colors.cyan })
hi(0, "PreCondit", { fg = colors.cyan })
hi(0, "Special", { fg = colors.gray05, bg = colors.none })
hi(0, "SpecialChar", { fg = colors.cyan })
hi(0, "Tag", { fg = colors.yellow })
hi(0, "Delimiter", { fg = colors.teal })
hi(0, "SpecialComment", { fg = colors.blue })
hi(0, "Debug", { fg = colors.red })
hi(0, "Underlined", { fg = colors.cyan, bg = colors.none, underline = true })
hi(0, "Ignore", { fg = colors.gray07 })
hi(0, "Error", { fg = colors.red, bg = colors.bright_red, bold = true, underline = true })
hi(0, "Todo", { fg = colors.cyan, bg = colors.none, bold = true, italic = true })

hi(0, "healthError", { fg = colors.red })
hi(0, "healthSuccess", { fg = colors.green })
hi(0, "healthWarning", { fg = colors.yellow })

-- Markdown
hi(0, "markdownH1", { fg = colors.bright_white, bold = true })
hi(0, "markdownH2", { fg = colors.bright_white, bold = true })
hi(0, "markdownH3", { fg = colors.bright_white, bold = true })
hi(0, "markdownH4", { fg = colors.bright_white, bold = true })
hi(0, "markdownH5", { fg = colors.bright_white, bold = true })
hi(0, "markdownH6", { fg = colors.bright_white, bold = true })
hi(0, "markdownHeadingDelimiter", { fg = colors.gray05 })
hi(0, "markdownHeadingRule", { fg = colors.gray05 })
hi(0, "markdownId", { fg = colors.cyan })
hi(0, "markdownIdDeclaration", { fg = colors.blue })
hi(0, "markdownIdDelimiter", { link = "Delimiter" })
hi(0, "markdownLinkDelimiter", { fg = colors.gray05 })
hi(0, "markdownLinkText", { fg = colors.bright_white, italic = true })
hi(0, "markdownListMarker", { fg = colors.yellow })
hi(0, "markdownOrderedListMarker", { fg = colors.yellow })
hi(0, "markdownRule", { fg = colors.gray05 })
hi(0, "markdownUrl", { fg = colors.gray06, bg = colors.none })
hi(0, "markdownBlockquote", { fg = colors.gray07 })
hi(0, "markdownBold", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "markdownItalic", { fg = colors.fg, bg = colors.none, italic = true })
hi(0, "markdownCode", { fg = colors.fg, bg = colors.gray09 })
hi(0, "markdownCodeBlock", { fg = colors.fg, bg = colors.gray09 })
hi(0, "markdownCodeDelimiter", { link = "Delimiter" })

-- Treesitter
hi(0, "@variable", { fg = colors.fg, bg = colors.none })
hi(0, "@field", { fg = colors.fg, bg = colors.none })
hi(0, "@symbol", { fg = colors.gray06, bg = colors.none })
hi(0, "@boolean", { link = "Boolean" })
hi(0, "@number", { link = "Number" })
hi(0, "@float", { link = "Float" })
hi(0, "@constant", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "@constant.builtin", { fg = colors.magenta, bg = colors.none, bold = true })
hi(0, "@character", { link = "Character" })
hi(0, "@character.special", { fg = colors.gray06, bg = colors.none })
hi(0, "@string", { link = "String" })
hi(0, "@string.regex", { link = "String" })
hi(0, "@string.escape", { fg = colors.cyan, bg = colors.none })
hi(0, "@string.special", { fg = colors.green, bg = colors.none })
hi(0, "@punctutation.delimiter", { link = "Delimiter" })
hi(0, "@punctutation.bracket", { link = "Delimiter" })
hi(0, "@punctutation.special", { link = "Delimiter" })
hi(0, "@operator", { link = "Operator" })
hi(0, "@define", { link = "Keyword" })
hi(0, "@preproc", { link = "Keyword" })
hi(0, "@error", { fg = colors.red, bg = colors.none })
hi(0, "@conditional", { link = "Conditional" })

hi(0, "@parameter", { fg = colors.gray06, bg = colors.none })
hi(0, "@constructor", { fg = colors.bright_yellow, bg = colors.none })
hi(0, "@constructor.javascript", { fg = colors.bright_yellow, bg = colors.none })
hi(0, "@constructor.lua", { fg = colors.fg })

hi(0, "@keyword", { link = "Keyword" })
hi(0, "@keyword.function", { link = "Keyword" })
hi(0, "@keyword.operator", { link = "Operator" })
hi(0, "@keyword.return", { link = "Keyword" })
hi(0, "@keyword.export", { link = "Keyword" })
hi(0, "@include", { link = "Include" })

hi(0, "@function", { link = "Function" })
hi(0, "@function.builtin", { link = "Function" })
hi(0, "@function.call", { link = "Function" })
hi(0, "@function.macro", { link = "Function" })
hi(0, "@method", { link = "Function" })
hi(0, "@method.call", { link = "Function" })

hi(0, "@type", { link = "Type" })

hi(0, "@text", { fg = colors.fg })

hi(0, "@tag", { fg = colors.yellow })
hi(0, "@tag.attribute", { fg = colors.fg, italic = true })
hi(0, "@tag.delimiter", { fg = colors.gray05, bold = true })

hi(0, "@lsp.type.variable", { fg = colors.fg })
hi(0, "@lsp.type.property", { fg = colors.fg })
hi(0, "@lsp.type.parameter", { fg = colors.fg })
hi(0, "@lsp.type.function", { fg = colors.blue })
hi(0, "@lsp.type.method", { fg = colors.blue })
hi(0, "@lsp.typemod.function.readonly", { fg = colors.blue })
hi(0, "@lsp.typemod.member.declaration", { fg = colors.fg })
hi(0, "@lsp.mod.deprecated", { fg = colors.red })
hi(0, "@lsp.mod.readonly", { fg = colors.fg })

-- JavaScript
hi(0, "@variable.javascript", { fg = colors.fg })
-- LSP
hi(0, "LspReferenceText", { fg = colors.bg, bg = colors.magenta })
hi(0, "LspReferenceRead", { fg = colors.bg, bg = colors.magenta })
hi(0, "LspReferenceWrite", { fg = colors.bg, bg = colors.magenta })
-- Diagnostics
hi(0, "DiagnosticError", { fg = colors.red })
hi(0, "DiagnosticWarn", { fg = colors.yellow, bg = colors.bright_yellow })
hi(0, "DiagnosticInfo", { fg = colors.blue, bg = colors.bright_blue })
hi(0, "DiagnosticHint", { fg = colors.cyan, bg = colors.bright_cyan })
hi(0, "DiagnosticUnderlineError", { fg = colors.red, undercurl = true, sp = colors.red })
hi(0, "DiagnosticUnderlineWarn", { fg = colors.yellow, undercurl = true, sp = colors.yellow })
hi(0, "DiagnosticUnderlineInfo", { fg = colors.blue, undercurl = true, sp = colors.blue })
hi(0, "DiagnosticUnderlineHint", { fg = colors.cyan, undercurl = true, sp = colors.cyan })
-- GitSigns
hi(0, "GitSignsAdd", { link = "DiffAdd" })
hi(0, "GitSignsAddNr", { fg = colors.bright_green })
hi(0, "GitSignsAddLn", { link = "DiffAdd" })
hi(0, "GitSignsChange", { link = "DiffChange" })
hi(0, "GitSignsChangeNr", { fg = colors.teal })
hi(0, "GitSignsChangeLn", { link = "DiffChange" })
hi(0, "GitSignsDelete", { link = "DiffDelete" })
hi(0, "GitSignsDeleteNr", { fg = colors.bright_old_red })
hi(0, "GitSignsDeleteLn", { link = "DiffDelete" })
-- Telescope
hi(0, "TelescopeSelectionCaret", { fg = colors.gray10 })
hi(0, "TelescopeBorder", { fg = colors.fg })
hi(0, "TelescopePromptBorder", { fg = colors.gray03 })
hi(0, "TelescopeResultsBorder", { fg = colors.gray07 })
hi(0, "TelescopePreviewBorder", { fg = colors.gray05 })
hi(0, "TelescopeMatching", { fg = colors.blue, bg = colors.match_paren_bg })
hi(0, "TelescopePromptPrefix", { fg = colors.fg })
-- Sneak
hi(0, "Sneak", { fg = colors.pink, bg = colors.dark_pink })
hi(0, "SneakScope", { bg = colors.gray04 })
-- Mini
hi(0, "MiniCompletionActiveParameter", { underline = true })
-- Neotest
hi(0, "NeotestFailed", { fg = colors.red, bg = colors.bright_red })
hi(0, "NeotestPassed", { fg = colors.green, bg = colors.bright_green })
hi(0, "NeotestRunning", { fg = colors.black })

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
