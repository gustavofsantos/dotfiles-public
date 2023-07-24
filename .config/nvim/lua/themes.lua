local has_nordic, _ = pcall(require, 'nordic')
if has_nordic then
  local palette = require('nordic.colors')
  local bg = "#151515"
  require('nordic').setup({
    telescope = {
      style = 'flat'
    },
    override = {
      -- Normal = { bg = bg },
      -- NormalNC = { bg = bg },
      -- NormalSB = { bg = bg },
      Keyword = { italic = true },
      StatusLine = { fg = palette.white2, bg = palette.gray3},
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

      ['@keyword'] = { italic = true },
      ['@keyword.function'] = { italic = true },
      ['@keyword.return'] = { italic = true },
      ['@punctuation.bracket'] = { fg = palette.gray4 },
      ['@tag.delimiter'] = { fg = palette.gray4 },
      ['@tag.attribute'] = { italic = true },
    }
  })
end

local has_kanagawa, _ = pcall(require, 'kanagawa')
if has_kanagawa then
  local fg_color = "#fafafa"
  local bg_color = "#151515"
  local cursor_line_color = "#1c1c1c"
  local statusline_bg = "#dddddd"
  local statuslinenc_bg = "#000000"
  local sumiInk0 = "#151515"
  local sumiInk1 = "#1b1b13"
  local sumiInk2 = "#222227"
  local sumiInk3 = "#232338"
  local sumiInk4 = "#353541"
  local sumiInk5 = "#47475b"
  local sumiInk6 = "#54546D"
  local springViolet2 = "#9CABCA"

  require('kanagawa').setup {
    dimInactive = false,
    globalStatus = true,
    commentStyle = { italic = true },
    functionStyle = { italic = true, bold = true },
    keywordStyle = { italic = true},
    statementStyle = { italic = true, bold = true },
    typeStyle = { italic = true },
    variablebuiltinStyle = { italic = true},
    transparent = true,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        }
      },
    },
    overrides = function (colors)
      return {
        -- Normal = { bg = bg_color },
        -- NormalNC = { bg = bg_color },

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

        ['@type'] = { italic = false, bold = true },
        ['@tag'] = { italic = false },
        ['@tag.delimiter'] = { fg = colors.palette.sumiInk6 },
        ['@tag.attribute'] = { italic = true },
        ['@punctuation.bracket'] = { fg = colors.palette.sumiInk6 },
      }
    end
  }
end

local has_github_themes, _ = pcall(require, 'github-theme')
if has_github_themes then
  require('github-theme').setup({
    options = {
      hide_end_of_buffer = false,
      hide_nc_statusline = false,
      styles = {
        comments = 'italic',
        functions = 'italic',
        keywords = 'italic',
        variables = 'NONE',
        conditionals = 'NONE',
        constants = 'bold',
        numbers = 'bold',
        operators = 'NONE',
        strings = 'NONE',
        types = 'bold',
      },
    }
  })
end
