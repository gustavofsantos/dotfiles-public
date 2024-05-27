local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  -- "netrw",
  -- "netrwPlugin",
  -- "netrwSettings",
  -- "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

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

require("keymappings")
require("notes")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  { import = "extra.plugins" },
}, {
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
