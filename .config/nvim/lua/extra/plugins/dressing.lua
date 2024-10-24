return { -- dressing
  "stevearc/dressing.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    select = {
      telescope = require("telescope.themes").get_cursor(),
    },
  },
}
