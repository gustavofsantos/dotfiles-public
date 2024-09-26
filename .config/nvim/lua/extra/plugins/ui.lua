return {
  {
    "stevearc/dressing.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      select = {
        telescope = require("telescope.themes").get_cursor(),
      },
    },
  },
  {
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
  {
    "yorickpeterse/nvim-pqf",
    config = true,
  },
}
