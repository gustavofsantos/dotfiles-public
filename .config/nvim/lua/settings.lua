vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.hlsearch = true
vim.opt.infercase = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.shell = "zsh"
vim.opt.backupskip = "/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.backspace = "start,eol,indent"
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 8
vim.opt.siso = 3
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.wildmenu = true
vim.opt.completeopt = "menu,noinsert,preview"
vim.opt.pumheight = 12
vim.opt.pumwidth = 50
vim.opt.wildmode = "longest,full"
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "no"
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.showtabline = 1
vim.opt.mouse = "nv"
vim.opt.colorcolumn = "100"

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })
vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.undofile = true
-- vim.opt.undodir = "~/.config/vim/undodir"
--
vim.cmd([[
let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(.*\)TODO\(.*\)$': '\1DOING\2',
    \     '^\(.*\)DOING\(.*\)$': '\1DONE\2',
    \     '^\(.*\)DONE\(.*\)$': '\1TODO\2',
    \     '^\(.*\)\[ \]\(.*\)$': '\1\[/\]\2',
    \     '^\(.*\)\[/\]\(.*\)$': '\1\[x\]\2',
    \     '^\(.*\)\[x\]\(.*\)$': '\1\[ \]\2',
    \     'it': 'fit',
    \     'fit': 'xit',
    \     'xit': 'it',
    \   }
    \ ]
]])

vim.cmd([[
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
]])

-- Vim Test
vim.cmd([[
let test#strategy = "toggleterm"
let test#javascript#playwright#options = "--headed --retries 0"
]])

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

vim.cmd([[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
augroup END]])

vim.api.nvim_create_user_command("Q", function()
  vim.cmd("q")
end, { desc = "Quit" })
vim.api.nvim_create_user_command("Qall", function()
  vim.cmd("qall")
end, { desc = "Quit all" })
vim.api.nvim_create_user_command("QA", function()
  vim.cmd("qa")
end, { desc = "Quit all" })
vim.api.nvim_create_user_command("E", function()
  vim.cmd("e")
end, { desc = "Edit file" })
vim.api.nvim_create_user_command("W", function()
  vim.cmd("w")
end, { desc = "Write file" })
vim.api.nvim_create_user_command("Wq", function()
  vim.cmd("wq")
end, { desc = "Write and quit" })
vim.api.nvim_create_user_command("WQ", function()
  vim.cmd("wq")
end, { desc = "Write and quit" })
vim.api.nvim_create_user_command("Wa", function()
  vim.cmd("wa")
end, { desc = "Write all" })
vim.api.nvim_create_user_command("WA", function()
  vim.cmd("wa")
end, { desc = "Write all" })

vim.api.nvim_create_user_command(
  "Journal",
  'lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>',
  { desc = "Open daily journal file", bang = true, nargs = 0 }
)

vim.api.nvim_create_user_command(
  "Worklog",
  ":vsp | :e ~/notes/worklog.md",
  { desc = "Open worklog file", bang = true, nargs = 0 }
)
