local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {
  signcolumn = true,
  numhl = false,
  attach_to_untracked = false,
  current_line_blame = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d>',
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
}
