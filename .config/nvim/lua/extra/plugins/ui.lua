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
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "branch", { "filename", path = 1 } },
        lualine_x = { "diff", "diagnostics", "progress", "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "yorickpeterse/nvim-pqf",
    config = true,
  },
  "anuvyklack/hydra.nvim",
}
