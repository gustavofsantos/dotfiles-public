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
    "projekt0n/circles.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "b0o/incline.nvim",
    dependencies = { "nvim-web-devicons" },
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("incline").setup({
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon }, { " " }, { filename } }
        end,
      })
    end,
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
            "branch",
            { "filename",    path = 1 },
            { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic", "coc" } },
          },
          lualine_x = {
            "diff",
            {
              "filetype",
              colored = false,  -- Displays filetype icon in color if set to true
              icon_only = true, -- Display only an icon for filetype
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename",    path = 1 },
            { "diagnostics", sources = { "nvim_diagnostic", "nvim_workspace_diagnostic", "coc" } },
          },
          lualine_x = {
            {
              "filetype",
              colored = false,  -- Displays filetype icon in color if set to true
              icon_only = true, -- Display only an icon for filetype
            },
          },
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
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              separator = true,
            },
          },
        },
      })

      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
    end,
  },
  {
    "yorickpeterse/nvim-pqf",
    config = true,
  },
}
