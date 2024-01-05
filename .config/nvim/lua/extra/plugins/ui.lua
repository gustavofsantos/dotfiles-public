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
    enabled = true,
    opts = {
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
        lualine_b = {},
        lualine_c = {
          "branch",
          { "filename", path = 1 },
          { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic", "coc" } },
        },
        lualine_x = {
          "diff",
          "progress",
          "filetype",
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filename", path = 1 },
          { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic", "coc" } },
        },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "yorickpeterse/nvim-pqf",
    config = true,
  },
}
