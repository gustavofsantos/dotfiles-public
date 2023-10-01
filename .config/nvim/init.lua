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

    { "echasnovski/mini.completion", event = "VeryLazy", opts = {} },
    { "echasnovski/mini.move", lazy = false, opts = {} },
    { "echasnovski/mini.splitjoin", lazy = false, opts = {} },
    { "echasnovski/mini.bracketed", event = "VeryLazy" },
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        config = function()
            local hipatterns = require("mini.hipatterns")
            require("echasnovski/mini.hipatterns").setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
    },

    "christoomey/vim-tmux-navigator",
    "christoomey/vim-tmux-runner",
    "christoomey/vim-conflicted",
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
