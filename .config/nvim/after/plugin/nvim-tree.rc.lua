local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 80
local height = 30

nvimtree.setup {
  respect_buf_cwd = true,
  view = {
    -- width = 36,
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        -- border = "rounded",
        width = width,
        height = height,
        row = (gheight - height) * 0.4,
        col = (gwidth - width) * 0.5,
      },
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true
      }
    },
    special_files = { "package.json", "Makefile", "README.md", "readme.md" },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}
