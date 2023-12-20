vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.background = "light"
vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.hidden = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.hlsearch = true
vim.opt.infercase = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.shell = "zsh"
vim.opt.backup = true
vim.opt.backupdir = { "/home/gustavo/.local/share/nvim/backups" }
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.writebackup = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.backspace = "start,eol,indent"
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
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
vim.opt.updatetime = 100
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.showtabline = 1
vim.opt.mouse = "nv"
-- vim.opt.colorcolumn = "100"

-- neovide
if vim.g.neovide then
  vim.o.guifont = "MonoLisa Nerd Font:h9"
  vim.g.transparency = 0.8
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_scroll_animation_length = 0.1
end

vim.opt.statusline = [[%f]]
vim.opt.statusline:append(" %=")
vim.opt.statusline:append("%{&ft}")

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.shortmess:append({
  I = false, -- No splash screen
  W = false, -- Don't print "written" when editing
  a = true, -- Use abbreviations in messages ([RO] intead of [readonly])
  c = true, -- Do not show ins-completion-menu messages (match 1 of 2)
  F = true, -- Do not print file name when opening a file
  s = true, -- Do not show "Search hit BOTTOM" message
})
vim.filetype.add({
  extension = {
    png = "image",
    jpg = "image",
    jpeg = "image",
    gif = "image",
  },
  filename = {
    [".eslintrc"] = "json",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    [".stylelintrc"] = "json",
  },
  pattern = {
    [".env.*"] = "sh",
  },
})

vim.opt.list = true
vim.opt.listchars = {
  nbsp = "⦸",
  tab = "  ",
  extends = "»",
  precedes = "«",
  trail = "·",
}
vim.opt.showbreak = "↳ "
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  diff = "╱",
  foldopen = "",
  foldclose = "",
}

vim.opt.undofile = true
-- vim.opt.undodir = "~/.config/vim/undodir"
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
let test#javascript#playwright#options = "--headed --retries 0 --workers 1"
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

vim.cmd("autocmd VimEnter * lua local ok, err = pcall(vim.cmd, 'VtrAttachToPane 1')")

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

vim.api.nvim_create_user_command("TaskNotes", function()
  -- Get the current git branch name
  local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

  -- Extract the file name after the first slash, if any
  local filename = vim.fn.match("(.*)/(.+)", branch_name) or branch_name

  -- Transform the filename to uppercase
  filename = vim.fn.toupper(filename)

  -- Construct the file path
  local file_path = vim.fn.expand("~/.notes/loggi/" .. filename .. ".md")

  -- Check if the file exists and is writable
  if vim.fn.filewritable(file_path) then
    vim.cmd("e " .. file_path)
  else
    -- Create the new markdown file
    vim.cmd("enew " .. file_path)

    -- Write a header with the transformed filename
    local content = "# " .. filename .. "\n\n"
    vim.fn.setfile(file_path, content)
  end
end, { desc = "Open task notes", bang = true, nargs = 0 })
