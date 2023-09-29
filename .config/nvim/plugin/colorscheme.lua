vim.cmd("highlight clear")
vim.g.colors_name = "gfs"

local colors = {
	bg = "#1a1a19",
	fg = "#d1d1d1",
	-- Normal
	black = "#333332",
	red = "#ff968c",
	green = "#61957f",
	yellow = "#ffc591",
	blue = "#8db4d4",
	magenta = "#de9bc8",
	cyan = "#7bb099",
	white = "#d1d1d1",
	-- Bright
	bright_black = "#4c4c4b",
	bright_red = "#ffafa5",
	bright_green = "#7aae98",
	bright_yellow = "#ffdeaa",
	bright_blue = "#a6cded",
	bright_magenta = "#f7b4e1",
	bright_cyan = "#94c9b2",
	bright_white = "#eaeaea",
	-- Grays
	gray01 = "#222221",
	gray02 = "#2a2a29",
	gray03 = "#323231",
	gray04 = "#3a3a39",
	gray05 = "#6a6a69",
	gray06 = "#767675",
	gray07 = "#b6b6b5",
	-- Special
	none = "NONE",
}

local hi = vim.api.nvim_set_hl

hi(0, "Normal", { fg = colors.fg, bg = colors.bg })
hi(0, "NormalNC", { fg = colors.fg, bg = colors.bg })
hi(0, "SignColumn", { fg = colors.fg, bg = colors.bg })
hi(0, "EndOfBuffer", { fg = colors.gray03 })
hi(0, "NormalFloat", { fg = colors.fg, bg = colors.gray02 })
hi(0, "FloatBorder", { fg = colors.blue, bg = colors.gray02 })
hi(0, "ColorColumn", { fg = colors.none, bg = colors.gray01 })
hi(0, "Conceal", { fg = colors.gray05 })
hi(0, "Cursor", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "CursorIM", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "CursorLineNr", { fg = colors.gray07 })
hi(0, "Directory", { fg = colors.blue, bg = colors.none, bold = true })
hi(0, "DiffAdd", { fg = colors.bright_green, bg = colors.none, reverse = true })
hi(0, "DiffChange", { fg = colors.bright_blue, bg = colors.none, reverse = true })
hi(0, "DiffDelete", { fg = colors.bright_red, bg = colors.none, reverse = true })
hi(0, "DiffText", { fg = colors.fg, bg = colors.none, reverse = true })
hi(0, "ErrorMsg", { fg = colors.red })
hi(0, "Folded", { fg = colors.gray05, bg = colors.none, italic = true })
hi(0, "FoldColumn", { fg = colors.blue })
hi(0, "IncSearch", { reverse = true })
hi(0, "LineNr", { fg = colors.gray05 })
hi(0, "MatchParen", { fg = colors.yellow, bold = true })
hi(0, "ModeMsg", { fg = colors.cyan, bold = true })
hi(0, "MoreMsg", { fg = colors.cyan, bold = true })
hi(0, "NonText", { fg = colors.gray03 })
hi(0, "Pmenu", { fg = colors.gray07, bg = colors.gray02 })
hi(0, "PmenuSel", { fg = colors.bg, bg = colors.gray06 })
hi(0, "PmenuSbar", { fg = colors.fg, bg = colors.gray02 })
hi(0, "PmenuThumb", { fg = colors.fg, bg = colors.gray05 })
hi(0, "Question", { fg = colors.green, bold = true })
hi(0, "QuickFixLine", { fg = colors.blue, bg = colors.gray01, bold = true, italic = true })
hi(0, "qfLineNr", { fg = colors.blue, bg = colors.gray01 })
hi(0, "Search", { reverse = true })
hi(0, "SpecialKey", { fg = colors.gray03 })
hi(0, "SpellBad", { fg = colors.red, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellCap", { fg = colors.blue, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellLocal", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "SpellRare", { fg = colors.cyan, bg = colors.none, italic = true, undercurl = true })
hi(0, "StatusLine", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "StatusLineNC", { fg = colors.gray06, bg = colors.gray01 })
hi(0, "StatusLineTerm", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "StatusLineTermNC", { fg = colors.gray07, bg = colors.gray01 })
hi(0, "TabLineFill", { fg = colors.gray05, bg = colors.gray01 })
hi(0, "TablineSel", { fg = colors.bg, bg = colors.gray07 })
hi(0, "Tabline", { fg = colors.gray05 })
hi(0, "Title", { fg = colors.cyan, bg = colors.none, bold = true })
hi(0, "Visual", { fg = colors.black, bg = colors.bright_yellow })
hi(0, "VisualNOS", { fg = colors.none, bg = colors.gray03 })
hi(0, "WarningMsg", { fg = colors.yellow, bold = true })
hi(0, "WildMenu", { fg = colors.bg, bg = colors.blue, bold = true })
hi(0, "CursorColumn", { fg = colors.none, bg = colors.gray02 })
hi(0, "CursorLine", { fg = colors.none, bg = colors.gray01 })
hi(0, "ToolbarLine", { fg = colors.fg, bg = colors.gray01 })
hi(0, "ToolbarButton", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "NormalMode", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "InsertMode", { fg = colors.green, bg = colors.none, reverse = true })
hi(0, "VisualMode", { fg = colors.cyan, bg = colors.none, reverse = true })
hi(0, "VertSplit", { fg = colors.gray02 })
hi(0, "CommandMode", { fg = colors.gray05, bg = colors.none, reverse = true })
hi(0, "Warnings", { fg = colors.yellow })
hi(0, "Type", { fg = colors.cyan })
hi(0, "StorageClass", { fg = colors.cyan })
hi(0, "Structure", { fg = colors.fg })
hi(0, "Constant", { fg = colors.cyan })
hi(0, "Comment", { fg = colors.gray05, bg = colors.none, bold = false, italic = true })
hi(0, "Conditional", { fg = colors.blue, bg = colors.none, bold = false, italic = false })
hi(0, "Keyword", { fg = colors.blue, bg = colors.none, bold = false, italic = true })
hi(0, "Repeat", { fg = colors.blue, bg = colors.none, bold = false, italic = false })
hi(0, "Boolean", { fg = colors.cyan, bg = colors.none, bold = true, italic = false })
hi(0, "Function", { fg = colors.bright_blue, bg = colors.none, bold = false, italic = true })
hi(0, "Identifier", { fg = colors.fg, bg = colors.none })
hi(0, "String", { fg = colors.bright_green, bg = colors.none })
hi(0, "StringDelimiter", { fg = colors.green, bg = colors.none })
hi(0, "Character", { fg = colors.cyan })
hi(0, "Number", { fg = colors.cyan })
hi(0, "Float", { fg = colors.cyan })
hi(0, "Statement", { fg = colors.blue })
hi(0, "Label", { fg = colors.cyan })
hi(0, "Operator", { fg = colors.gray06 })
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
hi(0, "Delimiter", { fg = colors.gray07 })
hi(0, "SpecialComment", { fg = colors.blue })
hi(0, "Debug", { fg = colors.red })
hi(0, "Underlined", { fg = colors.cyan, bg = colors.none, underline = true })
hi(0, "Ignore", { fg = colors.gray07 })
hi(0, "Error", { fg = colors.red, bg = colors.none, bold = true, underline = true })
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
hi(0, "markdownIdDelimiter", { fg = colors.cyan })
hi(0, "markdownLinkDelimiter", { fg = colors.gray05 })
hi(0, "markdownLinkText", { fg = colors.bright_white, italic = true })
hi(0, "markdownListMarker", { fg = colors.yellow })
hi(0, "markdownOrderedListMarker", { fg = colors.yellow })
hi(0, "markdownRule", { fg = colors.gray05 })
hi(0, "markdownUrl", { fg = colors.gray06, bg = colors.none })
hi(0, "markdownBlockquote", { fg = colors.gray07 })
hi(0, "markdownBold", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "markdownItalic", { fg = colors.fg, bg = colors.none, italic = true })
hi(0, "markdownCode", { fg = colors.fg, bg = colors.gray02 })
hi(0, "markdownCodeBlock", { fg = colors.fg, bg = colors.gray02 })
hi(0, "markdownCodeDelimiter", { fg = colors.fg, bg = colors.gray02 })

-- Treesitter
hi(0, "@variable", { fg = colors.gray07, bg = colors.none })
hi(0, "@field", { fg = colors.gray07, bg = colors.none })
hi(0, "@symbol", { fg = colors.gray06, bg = colors.none })
hi(0, "@boolean", { fg = colors.fg, bg = colors.none, bold = true })
hi(0, "@number", { fg = colors.fg, bg = colors.none })
hi(0, "@float", { fg = colors.fg, bg = colors.none })
hi(0, "@character", { fg = colors.gray06, bg = colors.none })
hi(0, "@character.special", { fg = colors.gray06, bg = colors.none })
hi(0, "@string", { fg = colors.bright_green, bg = colors.none })
hi(0, "@string.regex", { fg = colors.bright_green, bg = colors.none })
hi(0, "@string.escape", { fg = colors.bright_cyan, bg = colors.none })
hi(0, "@string.special", { fg = colors.bright_green, bg = colors.none })
hi(0, "@punctutation.delimiter", { fg = colors.gray07, bg = colors.none })
hi(0, "@punctutation.braket", { fg = colors.gray07, bg = colors.none })
hi(0, "@punctutation.special", { fg = colors.gray07, bg = colors.none })
hi(0, "@operator", { fg = colors.gray07, bg = colors.none })
hi(0, "@define", { fg = colors.blue, bg = colors.none })
hi(0, "@preproc", { fg = colors.blue, bg = colors.none })
hi(0, "@error", { fg = colors.red, bg = colors.none })

hi(0, "@parameter", { fg = colors.gray07, bg = colors.none })
hi(0, "@contructor", { fg = colors.gray07, bg = colors.none })

hi(0, "@keyword", { fg = colors.bright_magenta })
hi(0, "@keyword.function", { fg = colors.bright_magenta })
hi(0, "@keyword.operator", { fg = colors.bright_magenta })
hi(0, "@keyword.return", { fg = colors.bright_magenta })
hi(0, "@keyword.export", { fg = colors.bright_magenta })
hi(0, "@include", { fg = colors.bright_magenta })

hi(0, "@function", { fg = colors.bright_blue, italic = true })
hi(0, "@function.builtin", { fg = colors.bright_blue, italic = true })
hi(0, "@function.call", { fg = colors.bright_blue, italic = true })
hi(0, "@function.macro", { fg = colors.bright_blue, italic = true })
hi(0, "@method", { fg = colors.bright_blue, italic = true })
hi(0, "@method.call", { fg = colors.bright_blue, italic = true })

hi(0, "@text", { fg = colors.fg })

hi(0, "@lsp.type.variable", { fg = colors.fg })
hi(0, "@lsp.mod.deprecated", { fg = colors.red })

hi(0, "TSAnnotation", { fg = colors.green })                                                   -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
hi(0, "TSAttribute", { fg = colors.fg })                                                       -- (unstable) TODO: docs
hi(0, "TSBoolean", { fg = colors.cyan, bg = colors.none, bold = true, italic = false })        -- true or false
hi(0, "TSCharacter", { fg = colors.cyan })                                                     -- For characters.
hi(0, "TSComment", { fg = colors.gray05, bg = colors.none, bold = false, italic = true })      -- For comment blocks.
hi(0, "TSConditional", { fg = colors.blue, bold = false, italic = false })                     -- For keywords related to conditionnals.
hi(0, "TSConstant", { fg = colors.fg })                                                        -- For constants
hi(0, "TSConstBuiltin", { fg = colors.cyan, italic = true })                                   -- For constants that are built in the language: `nil` in Lua.
hi(0, "TSConstMacro", { fg = colors.cyan })                                                    -- For constants that are defined by macros: `NULL` in colors.
hi(0, "TSConstructor", { fg = colors.gray07 })                                                 -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
hi(0, "TSError", { fg = colors.red })                                                          -- For syntax/parser errors.
hi(0, "TSException", { fg = colors.yellow })                                                   -- For exception related keywords.
hi(0, "TSField", { fg = colors.cyan })                                                         -- For fields.
hi(0, "TSFloat", { fg = colors.cyan })                                                         -- For floats.
hi(0, "TSFunction", { fg = colors.fg, bold = false, italic = true })                           -- For fuction (calls and definitions).
hi(0, "TSFuncBuiltin", { fg = colors.fg, bold = false, italic = true })                        -- For builtin functions: `table.insert` in Lua.
hi(0, "TSFuncMacro", { fg = colors.blue })                                                     -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
hi(0, "TSInclude", { fg = colors.blue, italic = true })                                        -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
hi(0, "TSKeyword", { fg = colors.blue, bold = false, italic = false })                         -- For keywords that don't fall in previous categories.
hi(0, "TSKeywordFunction", { fg = colors.blue, bold = false, italic = true })                  -- For keywords used to define a fuction.
hi(0, "TSKeywordOperator", { fg = colors.yellow })                                             -- For operators that are English words, e.g. `and`, `as`, `or`.
hi(0, "TSKeywordReturn", { fg = colors.blue, bold = false, italic = false })                   -- For the `return` and `yield` keywords.
hi(0, "TSLabel", { fg = colors.cyan })                                                         -- For labels: `label:` in C and `:label:` in Lua.
hi(0, "TSMethod", { fg = colors.bright_blue, bold = false, italic = true })                    -- For method calls and definitions.
hi(0, "TSNamespace", { fg = colors.blue })                                                     -- For identifiers referring to modules and namespaces.
-- TSNone = {}, -- No highlighting. Don't change the values of this highlight group.
hi(0, "TSNumber", { fg = colors.cyan })                                                        -- For all numbers
hi(0, "TSOperator", { fg = colors.yellow })                                                    -- For any operator: `+`, but also `->` and `*` in colors.
hi(0, "TSParameter", { fg = colors.fg })                                                       -- For parameters of a function.
hi(0, "TSParameterReference", { fg = colors.fg })                                              -- For references to parameters of a function.
hi(0, "TSProperty", { fg = colors.blue })                                                      -- Same as `TSField`.
hi(0, "TSPunctDelimiter", { fg = colors.gray05 })                                              -- For delimiters ie: `.`
hi(0, "TSPunctBracket", { fg = colors.gray05 })                                                -- For brackets and parens.
hi(0, "TSPunctSpecial", { fg = colors.green })                                                 -- For special punctutation that does not fall in the catagories before.
hi(0, "TSRepeat", { fg = colors.blue, bold = false, italic = false })                          -- For keywords related to loops.
hi(0, "TSString", { fg = colors.cyan })                                                        -- For strings.
hi(0, "TSStringRegex", { fg = colors.green })                                                  -- For regexes.
hi(0, "TSStringEscape", { fg = colors.cyan })                                                  -- For escape characters within a string.
hi(0, "TSStringSpecial", { fg = colors.green })                                                -- For strings with special meaning that don't fit into the above categories.
hi(0, "TSSymbol", { fg = colors.green })                                                       -- For identifiers referring to symbols or atoms.
hi(0, "TSTag", { fg = colors.yellow })                                                         -- Tags like html tag names.
hi(0, "TSTagAttribute", { fg = colors.fg, italic = true })                                     -- For html tag attributes.
hi(0, "TSTagDelimiter", { fg = colors.gray05 })                                                -- Tag delimiter like `<` `>` `/`
hi(0, "TSText", { fg = colors.fg })                                                            -- For strings considered text in a markup language.
hi(0, "TSStrong", { fg = colors.bright_white, bold = true })                                   -- For text to be represented in bold.
hi(0, "TSEmphasis", { fg = colors.bright_white, bold = true, italic = true })                  -- For text to be represented with emphasis.
hi(0, "TSUnderline", { fg = colors.bright_white, bg = colors.none, underline = true })         -- For text to be represented with an underline.
hi(0, "TSStrike", {})                                                                          -- For strikethrough text.
hi(0, "TSTitle", { fg = colors.fg, bg = colors.none, bold = true })                            -- Text that is part of a title.
hi(0, "TSLiteral", { fg = colors.fg })                                                         -- Literal text.
hi(0, "TSURI", { fg = colors.cyan })                                                           -- Any URL like a link or email.
hi(0, "TSMath", { fg = colors.blue })                                                          -- For LaTeX-like math environments.
hi(0, "TSTextReference", { fg = colors.yellow })                                               -- For footnotes, text references, citations.
hi(0, "TSEnvironment", { fg = colors.blue })                                                   -- For text environments of markup languages.
hi(0, "TSEnvironmentName", { fg = colors.bright_blue })                                        -- For the name/the string indicating the type of text environment.
hi(0, "TSNote", { fg = colors.blue, italic = true })                                           -- Text representation of an informational note.
hi(0, "TSWarning", { fg = colors.yellow, italic = true })                                      -- Text representation of a warning note.
hi(0, "TSDanger", { fg = colors.red, italic = true })                                          -- Text representation of a danger note.
hi(0, "TSType", { fg = colors.fg })                                                            -- For types.
hi(0, "TSTypeBuiltin", { fg = colors.blue })                                                   -- For builtin types.
hi(0, "TSVariable", { fg = colors.fg, bold = false, italic = false })                          -- Any variable name that does not have another highlight.
hi(0, "TSVariableBuiltin", { fg = colors.bright_yellow, bold = true, italic = false })         -- Variable names that are defined by the languages, like `this` or `self`.
-- LSP
hi(0, "LspReferenceText", { fg = colors.bg, bg = colors.magenta })                             -- used for highlighting "text" references
hi(0, "LspReferenceRead", { fg = colors.bg, bg = colors.magenta })                             -- used for highlighting "read" references
hi(0, "LspReferenceWrite", { fg = colors.bg, bg = colors.magenta })                            -- used for highlighting "write" references
-- Diagnostics
hi(0, "DiagnosticError", { fg = colors.red })                                                  -- base highlight group for "Error"
hi(0, "DiagnosticWarn", { fg = colors.yellow })                                                -- base highlight group for "Warning"
hi(0, "DiagnosticInfo", { fg = colors.blue })                                                  -- base highlight group from "Information"
hi(0, "DiagnosticHint", { fg = colors.cyan })                                                  -- base highlight group for "Hint"
hi(0, "DiagnosticUnderlineError", { fg = colors.red, undercurl = true, sp = colors.red })      -- used to underline "Error" diagnostics.
hi(0, "DiagnosticUnderlineWarn", { fg = colors.yellow, undercurl = true, sp = colors.yellow }) -- used to underline "Warning" diagnostics.
hi(0, "DiagnosticUnderlineInfo", { fg = colors.blue, undercurl = true, sp = colors.blue })     -- used to underline "Information" diagnostics.
hi(0, "DiagnosticUnderlineHint", { fg = colors.cyan, undercurl = true, sp = colors.cyan })     -- used to underline "Hint" diagnostics.
-- GitSigns
hi(0, "GitSignsAdd", { fg = colors.bright_green })                                             -- diff mode: Added line |diff.txt|
hi(0, "GitSignsAddNr", { fg = colors.bright_green })                                           -- diff mode: Added line |diff.txt|
hi(0, "GitSignsAddLn", { fg = colors.bright_green })                                           -- diff mode: Added line |diff.txt|
hi(0, "GitSignsChange", { fg = colors.bright_yellow })                                         -- diff mode: Changed line |diff.txt|
hi(0, "GitSignsChangeNr", { fg = colors.bright_yellow })                                       -- diff mode: Changed line |diff.txt|
hi(0, "GitSignsChangeLn", { fg = colors.bright_yellow })                                       -- diff mode: Changed line |diff.txt|
hi(0, "GitSignsDelete", { fg = colors.bright_red })                                            -- diff mode: Deleted line |diff.txt|
hi(0, "GitSignsDeleteNr", { fg = colors.bright_red })                                          -- diff mode: Deleted line |diff.txt|
hi(0, "GitSignsDeleteLn", { fg = colors.bright_red })                                          -- diff mode: Deleted line |diff.txt|

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
