local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.cmd([[
let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(.*\)TODO\(.*\)$': '\1DOING\2',
    \     '^\(.*\)DOING\(.*\)$': '\1DONE\2',
    \     '^\(.*\)DONE\(.*\)$': '\1TODO\2',
    \     '^\(.*\)\[ \]\(.*\)$': '\1\[-\]\2',
    \     '^\(.*\)\[-\]\(.*\)$': '\1\[x\]\2',
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

require("lazy").setup({
    { import = "extra.plugins" },
    "tpope/vim-sleuth",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "mbbill/undotree",
    "justinmk/vim-sneak",
    "AndrewRadev/switch.vim",
    "christoomey/vim-tmux-navigator",
    "christoomey/vim-tmux-runner",
    "christoomey/vim-conflicted",
    "github/copilot.vim",
}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

require("settings")
require("keymappings")
