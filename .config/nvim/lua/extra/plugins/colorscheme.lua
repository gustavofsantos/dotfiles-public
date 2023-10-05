return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
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
            Constant = { fg = colors.palette.fujiWhite },

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
            ["@conditional.ternary"] = { fg = colors.palette.oniViolet, italic = false },
          }
        end,
      })

      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
    "svrana/neosolarized.nvim",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    priority = 1000,
    lazy = false,
    enabled = false,
    config = function()
      local n = require("neosolarized").setup({
        comment_italics = true,
        background_set = true,
      })

      n.Group.link("@lsp.type.parameter", n.groups["@variable"])
      n.Group.new("@lsp.type.function", n.colors.blue, n.colors.none, n.styles.italic)
      n.Group.new("@lsp.type.property", n.colors.base0, n.colors.none, n.styles.italic)

      n.Group.new("Delimiter", n.colors.base00)
      n.Group.link("Operator", n.groups.Normal)

      n.Group.new("@include", n.colors.magenta)
      n.Group.new("@boolean", n.colors.orange)
      n.Group.new("@variable", n.colors.base1)
      n.Group.new("@keyword", n.colors.green, n.colors.none, n.styles.italic)
      n.Group.new("@variable.builtin", n.colors.orange, n.colors.none, n.styles.bold)
      n.Group.link("@keyword.function", n.groups["@keyword"])
      n.Group.link("@punctuation.delimiter", n.groups.Delimiter)
      n.Group.link("@field", n.groups["@variable"])
      n.Group.link("@tag.delimiter", n.groups.Delimiter)
      n.Group.new("@parameter", n.colors.base1, n.colors.none, n.styles.italic)
      n.Group.link("@property", n.groups["@parameter"])

      vim.cmd([[colorscheme neosolarized]])
    end,
  },
}
