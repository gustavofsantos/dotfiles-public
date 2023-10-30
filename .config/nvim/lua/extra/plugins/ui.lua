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
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          mode = "tabs",
          themable = true,
          separator_style = "thin",
          always_show_bufferline = false,
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          indicator = {
            style = "none",
          },
        },
        highlights = {},
      })

      vim.keymap.set(
        "n",
        "<Tab>",
        "<cmd>BufferLineCycleNext<cr>",
        { noremap = true, silent = true, desc = "Cycle next tab" }
      )
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")

      -- configure lualine with modified theme
      lualine.setup({
        options = {
          theme = "solarized_dark",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = {},
          lualine_b = { "diagnostics" },
          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = {
            "diff",
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
