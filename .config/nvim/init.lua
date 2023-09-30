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

    { "echasnovski/mini.completion", lazy = false,      opts = {} },
    { 'echasnovski/mini.move',       lazy = false,      opts = {} },
    { 'echasnovski/mini.splitjoin',  lazy = false,      opts = {} },
    { 'echasnovski/mini.bracketed',  event = "VeryLazy" },
    { 'echasnovski/mini.hipatterns', event = "VeryLazy" },

    'christoomey/vim-tmux-navigator',
    'christoomey/vim-tmux-runner',
    'christoomey/vim-conflicted',
})

require("settings")
require("keymappings")
