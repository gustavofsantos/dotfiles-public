local has_conflict, conflict = pcall(require, 'git-conflict')
if (has_conflict) then
  conflict.setup {}
end

--[[
  Mappings
    co - choose ours
    ct - choose theirs
    cb - choose both
    c0 - choose none
    ]x - move to previous conflict
    [x - move to next conflict
--]]

local has_gitsigns, gitsigns = pcall(require, 'gitsigns')
if (has_gitsigns) then
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
end

local has_diffview, diffview = pcall(require, 'diffview')
if (has_diffview) then
  diffview.setup {}

  vim.keymap.set("n", "<leader>gvo", ":DiffviewOpen")
end

-- Git
vim.keymap.set("n", "<leader>gs", ":tab Git<CR>")
vim.keymap.set("n", "<leader>b",
  ":<C-U>!git blame <C-R>=expand(\"%:p\") <CR> | sed -n <C-R>=line(\"'<\") <CR>,<C-R>=line(\"'>\") <CR>p <CR>")
