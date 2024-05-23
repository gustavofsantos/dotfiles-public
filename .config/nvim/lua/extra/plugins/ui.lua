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
          lualine_b = {},
          lualine_c = {
            { "filename", path = 1 },
            { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic" } },
          },
          lualine_x = { "overseer", "filetype" },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename", path = 1 },
            { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic" } },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
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
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    enabled = false,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    lazy = true,
    opts = {
      animation = false,
      clickable = false,
      tabpages = true,
      sidebar_filetypes = {
        -- Or, specify the text used for the offset:
        undotree = {
          text = "undotree",
          align = "center", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        ["neo-tree"] = { event = "BufWipeout" },
        -- Or, specify all three
        Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
      },
    },
    version = "^1.0.0",
    keys = {
      { "<Tab>", "<cmd>BufferNext<CR>", mode = "n", desc = "Next buffer" },
      { "<S-Tab>", "<cmd>BufferPrevious<CR>", mode = "n", desc = "Previous buffer" },
      { "<A-c>", "<cmd>BufferClose<CR>", mode = "n", desc = "Close buffer" },

      { "<leader>1", "<cmd>BufferGoto 1<CR>", mode = "n", desc = "Switch to buffer 1" },
      { "<leader>2", "<cmd>BufferGoto 2<CR>", mode = "n", desc = "Switch to buffer 2" },
      { "<leader>3", "<cmd>BufferGoto 3<CR>", mode = "n", desc = "Switch to buffer 3" },
      { "<leader>4", "<cmd>BufferGoto 4<CR>", mode = "n", desc = "Switch to buffer 4" },
      { "<leader>5", "<cmd>BufferGoto 5<CR>", mode = "n", desc = "Switch to buffer 5" },
      { "<leader>6", "<cmd>BufferGoto 6<CR>", mode = "n", desc = "Switch to buffer 6" },
      { "<leader>7", "<cmd>BufferGoto 7<CR>", mode = "n", desc = "Switch to buffer 7" },
      { "<leader>8", "<cmd>BufferGoto 8<CR>", mode = "n", desc = "Switch to buffer 8" },
      { "<leader>9", "<cmd>BufferGoto 9<CR>", mode = "n", desc = "Switch to buffer 9" },
    },
  },
}
