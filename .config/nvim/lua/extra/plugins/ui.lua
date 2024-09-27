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
  { -- lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
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
          lualine_c = {
            { "filetype", colored = true, icon_only = true },
            { "filename", path = 1 },
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
          lualine_a = {},
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
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filetype", colored = true, icon_only = true },
            { "filename", path = 4 },
            "searchcount",
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filetype", colored = true, icon_only = true },
            { "filename", path = 4 },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {
          "quickfix",
          "oil",
          "lazy",
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
