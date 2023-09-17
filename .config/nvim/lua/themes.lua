local has_nordic, _ = pcall(require, "nordic")
if has_nordic then
    local palette = require("nordic.colors")
    require("nordic").setup({
        reduced_blue = true,
        telescope = {
            style = "flat",
        },
        override = {
            -- Normal = { bg = bg },
            -- NormalNC = { bg = bg },
            -- NormalSB = { bg = bg },
            Keyword = { italic = true },
            StatusLine = { fg = palette.white2, bg = palette.gray3 },
            StatusLineNC = { fg = palette.gray4, bg = palette.black },

            BufferlineFill = { bg = palette.grey0 },
            BufferlineBackground = { bg = palette.gray0 },
            BufferlineSeparator = { bg = palette.gray0, fg = palette.gray0 },
            BufferlineSeparatorVisible = { fg = palette.gray3 },
            BufferLineBufferSelected = { fg = palette.white2, bold = true, italic = false },
            BufferLineBufferVisible = { bg = palette.gray0, fg = palette.gray3 },

            NvimTreeGitDirty = { fg = palette.magenta.base },
            NvimTreeGitStaged = { fg = palette.magenta.base },
            NvimTreeGitMerge = { fg = palette.magenta.base },
            NvimTreeGitRenamed = { fg = palette.magenta.base },
            NvimTreeGitNew = { fg = palette.magenta.base },
            NvimTreeGitDeleted = { fg = palette.magenta.base },
            NvimTreeFolderName = { fg = palette.gray4 },
            NvimTreeOpenedFolderName = { fg = palette.gray3 },
            NvimTreeRootFolder = { fg = palette.gray3, italic = true },
            NvimTreeSpecialFile = { underline = true, italic = true, fg = palette.gray3 },
            NvimTreeNormalFloat = { bg = palette.gray0 },
            NvimTreeCursorLine = { bg = palette.gray0 },
            NvimTreeIndentMarker = { fg = palette.gray3 },

            ["@keyword"] = { italic = true },
            ["@keyword.function"] = { italic = true },
            ["@keyword.return"] = { italic = true },
            ["@punctuation.bracket"] = { fg = palette.gray4 },
            ["@tag.delimiter"] = { fg = palette.gray4 },
            ["@tag.attribute"] = { italic = true },
        },
    })
end

local has_kanagawa, _ = pcall(require, "kanagawa")
if has_kanagawa then
    require("kanagawa").setup({
        dimInactive = false,
        globalStatus = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true, bold = true },
        keywordStyle = { italic = true },
        statementStyle = { italic = true, bold = true },
        typeStyle = { italic = true },
        variablebuiltinStyle = { italic = true },
        transparent = false,
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
            return {
                -- Normal = { bg = colors.palette.sumiInk0 },
                -- NormalNC = { bg = bg_color }

                StatusLine = { bg = colors.palette.sumiInk4 },
                StatusLineNC = { bg = colors.palette.sumiInk2 },
                ColorColumn = { bg = colors.palette.sumiInk2 },

                NvimTreeGitDirty = { fg = colors.palette.oniViolet },
                NvimTreeGitStaged = { fg = colors.palette.oniViolet },
                NvimTreeGitMerge = { fg = colors.palette.oniViolet },
                NvimTreeGitRenamed = { fg = colors.palette.oniViolet },
                NvimTreeGitNew = { fg = colors.palette.oniViolet },
                NvimTreeGitDeleted = { fg = colors.palette.oniViolet },
                NvimTreeFolderName = { fg = colors.palette.fujiGray },
                NvimTreeOpenedFolderName = { fg = colors.palette.fujiGray },
                NvimTreeRootFolder = { fg = colors.palette.fujiGray, italic = true },
                NvimTreeSpecialFile = { underline = true, italic = true, fg = colors.palette.fujiGray },
                NvimTreeNormalFloat = { bg = colors.theme.ui.bg },
                NvimTreeCursorLine = { bg = colors.palette.sumiInk5 },
                NvimTreeIndentMarker = { fg = colors.palette.fujiGray },

                TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },

                ["@type"] = { italic = false, bold = true },
                ["@tag"] = { italic = false },
                ["@tag.delimiter"] = { fg = colors.palette.sumiInk6 },
                ["@tag.attribute"] = { italic = true },
                ["@punctuation.bracket"] = { fg = colors.palette.sumiInk6 },
            }
        end,
    })
end

local has_github_themes, _ = pcall(require, "github-theme")
if has_github_themes then
    require("github-theme").setup({
        options = {
            hide_end_of_buffer = false,
            hide_nc_statusline = false,
            styles = {
                comments = "italic",
                functions = "italic",
                keywords = "italic",
                variables = "NONE",
                conditionals = "NONE",
                constants = "bold",
                numbers = "bold",
                operators = "NONE",
                strings = "NONE",
                types = "bold",
            },
        },
    })
end
