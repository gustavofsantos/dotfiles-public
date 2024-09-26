return {
  { -- dressing
    "stevearc/dressing.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      select = {
        telescope = require("telescope.themes").get_cursor(),
      },
    },
  },
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup({
        debounce_threshold = {
          falling = 50,
          rising = 10
        },
        hide = {
          cursorline = false,
          focused_win = false,
          only_win = true -- Hide incline if only one window in tab
        },
        highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = "CursorLineNr"
            },
            InclineNormalNC = {
              default = true,
              group = "NormalFloat"
            }
          }
        },
        ignore = {
          buftypes = "special",
          filetypes = {},
          floating_wins = true,
          unlisted_buffers = true,
          wintypes = "special"
        },
        window = {
          margin = {
            horizontal = 1,
            vertical = 2
          },
          options = {
            signcolumn = "no",
            wrap = false
          },
          padding = 1,
          padding_char = " ",
          placement = {
            horizontal = "right",
            vertical = "top"
          },
          width = "fit",
          winhighlight = {
            active = {
              EndOfBuffer = "None",
              Normal = "InclineNormal",
              Search = "None"
            },
            inactive = {
              EndOfBuffer = "None",
              Normal = "InclineNormalNC",
              Search = "None"
            }
          },
          zindex = 50
        },
        render = function(props)
          local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')

          return {
            {
              fname,
            }
          }
        end,
      })
    end,
    event = 'VeryLazy',
  },
  { -- lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              draw_empty = true,
              padding = 0,
              fmt = function()
                return " "
              end,
            },
          },
          lualine_b = {
            { "filetype", colored = true, icon_only = true },
            { "filename", path = 4 },
          },
          lualine_c = {
            "searchcount",
            {
              "diagnostics",
              colored = true,
              sources = { "nvim_diagnostic", "nvim_workspace_diagnostic" }
            },
            "overseer",
          },
          lualine_x = {
            {
              "diff",
              colored = true,
              symbols = {
                added = ' ',
                modified = ' ',
                removed = ' '
              }
            }
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {
            {
              "mode",
              draw_empty = true,
              padding = 0,
              fmt = function()
                return " "
              end,
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              "filetype",
              colored = true,
              icon_only = true
            },
            {
              "filename",
              path = 4
            },
            {
              "diagnostics",
              colored = true,
              sources = { "nvim_diagnostic", "nvim_workspace_diagnostic" }
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          "quickfix",
          "overseer",
          "neo-tree",
          "fugitive",
          "toggleterm",
        },
      })
    end,
  },
  { -- pqf
    "yorickpeterse/nvim-pqf",
    config = true,
  },
}
