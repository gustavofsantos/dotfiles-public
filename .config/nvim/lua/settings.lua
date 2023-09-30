vim.opt.termguicolors  = true
vim.opt.hidden         = true
vim.opt.encoding       = "utf-8"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.hidden         = true
vim.opt.ai             = true
vim.opt.si             = true
vim.opt.hlsearch       = true
vim.opt.backup         = false
vim.opt.showcmd        = true
vim.opt.cmdheight      = 1
vim.opt.laststatus     = 2
vim.opt.expandtab      = true
vim.opt.shell          = "zsh"
vim.opt.backupskip     = "/tmp/*"
vim.opt.inccommand     = 'split'
vim.opt.ignorecase     = true
vim.opt.smarttab       = true
vim.opt.breakindent    = true
vim.opt.backspace      = 'start,eol,indent'
vim.opt.wrap           = false
vim.opt.shiftwidth     = 2
vim.opt.tabstop        = 2
vim.opt.scrolloff      = 4
vim.opt.foldcolumn     = "0"
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable     = true
vim.opt.pumheight      = 12
vim.opt.wildmenu       = true
vim.opt.completeopt    = "menu,noinsert,preview"
vim.opt.updatetime     = 250
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.signcolumn     = "yes"
vim.opt.cursorline     = true
vim.opt.swapfile       = false
vim.opt.wildmode       = "list:longest,full"
vim.opt.showtabline    = 1
vim.opt.mouse          = "nv"
vim.opt.colorcolumn    = "100"

vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.formatoptions:append { 'r' }
vim.opt.clipboard:append { "unnamedplus" }

vim.opt.undofile = true
vim.opt.undodir = "~/.config/vim/undodir"

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
