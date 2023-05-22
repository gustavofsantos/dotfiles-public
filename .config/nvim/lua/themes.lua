local has_nordic, _ = pcall(require, 'nordic')
if has_nordic then
  local palette = require('nordic.colors')
  require('nordic').setup({
    -- theme = 'onedark',
    telescope = {
      style = 'flat'
    },
    override = {
      Keyword = { italic = true },
      ['@keyword'] = { italic = true },
      ['@keyword.function'] = { italic = true },
      ['@keyword.return'] = { italic = true },
      ['@punctuation.bracket'] = { fg = palette.grey4 },
      ['@tag.delimiter'] = { fg = palette.grey4 },
      ['@tag.attribute'] = { italic = true },
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
