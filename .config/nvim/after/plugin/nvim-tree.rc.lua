local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

nvimtree.setup {
  respect_buf_cwd = true,
  view = {
    width = 36,
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
        file = false,
        folder = false
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
    enable = false,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}
