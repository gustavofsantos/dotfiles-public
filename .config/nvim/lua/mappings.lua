local utils = require("utils")
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local env = vim.env
local termcodes = utils.termcodes
local nmap = utils.nmap
local vmap = utils.vmap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap
local tnoremap = utils.tnoremap

nmap("Q", "<Nop>") -- disable Ex mode

-- copy and paste text from clipboard
nmap("cp", "\"+y")
vmap("cp", "\"+y")
nmap("cv", "\"+p")
vmap("cv", "\"+p")
nmap("cV", "\"+P")

-- vim-test
nmap("<leader>t", ":TestNearest<CR>")
nmap("<leader>T", ":TestFile<CR>")
nmap("<leader>a", ":TestSuite<CR>")
nmap("<leader>l", ":TestLast<CR>")
nmap("<leader>g", ":TestVisit<CR>")

nnoremap("dgh", ":diffget //2<CR>") -- vimdiff get from left
nnoremap("dgl", ":diffget //3<CR>") -- vimdiff get from right
nnoremap("<C-b>", ":NvimTreeToggle<CR>") -- toggle file explorer
nnoremap("<C-q>", ":q<CR>") -- close current buffer
inoremap("<C-q>", ":q<CR>") -- close current buffer
inoremap("<C-s>", "<Esc>:w<CR>") -- save buffer
nnoremap("<C-s>", ":w<CR>") -- save buffer
nnoremap("<C-t>", "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>") -- toggle terminal
inoremap("<C-t>", "<Esc><Cmd>exe v:count1 . \"ToggleTerm\"<CR>") -- toggle terminal
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")


-- Move lines
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Tabs
nnoremap("<A-h>", ":-tabmove<CR>")
nnoremap("<A-l>", ":+tabmove<CR>")

-- Notes
nnoremap("<leader>nj", ":Journal<CR>")
nnoremap("<leader>nd", ":vsp ~/notes/debug_notes.md<CR>")
nnoremap("<leader>nl", ":vsp ~/notes/loggi/work-notes.md<CR>")
nnoremap("<leader>nw", ":vsp ~/notes/loggi/worklog.md<CR>")

nnoremap("<leader><leader>", "<C-^>")
-- find non git-ignored files inside the current dir
nnoremap("<leader>ff", ":Telescope find_files theme=ivy<CR>")
-- find files using git source
nnoremap("<leader>fg", ":Telescope git_files theme=ivy<CR>")
nnoremap("<leader>fe", ":Telescope oldfiles theme=ivy<CR>")
nnoremap("<leader>fb", ":Telescope buffers theme=ivy<CR>")
nnoremap("<leader>fy", ":Telescope yank_history theme=ivy<CR>")
nnoremap("<leader>fl", ":Telescope live_grep theme=ivy<CR>")
nnoremap("<leader>fj", ":Telescope jumplist theme=ivy<CR>")
nnoremap("<F3>", ":Telescope grep_string theme=ivy<CR>")
vnoremap("<F3>", "\"zy:Telescope grep_string default_text=<C-r>z<cr>")
nnoremap("<F5>", ":UndotreeToggle<CR>")

-- code insights
nnoremap("<leader>ft", ":TroubleToggle<CR>")

-- switch
nnoremap("<leader>ss", ":Switch<CR>")

-- copy buffer path to clipboard
nnoremap("<leader>cbp", "<cmd>let @+ = expand(\"%\")<CR>")

-- Harpoon
nnoremap("<leader>m", ":lua require('harpoon.mark').add_file()<CR>") -- mark file with harpoon
nnoremap("<leader>fm", ":Telescope harpoon marks<CR>") -- find marks

-- Git
nnoremap("<leader>gs", ":tab G<CR>")
nnoremap("<leader>gb", ":Telescope git_branches theme=ivy<CR>")
vnoremap("<leader>b",
  ":<C-U>!git blame <C-R>=expand(\"%:p\") <CR> | sed -n <C-R>=line(\"'<\") <CR>,<C-R>=line(\"'>\") <CR>p <CR>")

-- Window
-- nnoremap("<leader>o", ":only<CR>")
-- nnoremap("<C-h>", "<C-w>h")
-- nnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k")
-- nnoremap("<C-l>", "<C-w>l")
nnoremap("<leader>ws", ":vsplit<CR>")
nnoremap("<leader>wS", ":split<CR>")
-- nnoremap("<leader>=", "<C-w>=")
tnoremap("<Esc>", "<C-\\><C-n>")

-- Editing

inoremap("<silent><expr><TAB>", "pumvisible() ? \"\\<C-n>\" : \"\\<TAB>\"")
inoremap("<expr><S-TAB>", "pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"")
-- Format current buffer
nnoremap("<leader>F", ":lua vim.lsp.buf.formatting()<CR>")
-- -- Open code action
-- nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
-- -- Rename current symbol
-- nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
-- nnoremap("gD", ":lua vim.lsp.buf.declaration()<CR>")
-- nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
-- nnoremap("gr", ":lua vim.lsp.buf.references()<CR>")
-- nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
