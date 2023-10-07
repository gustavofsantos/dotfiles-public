local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
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

require("settings")
require("keymappings")

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
  -- "christoomey/vim-tmux-runner",
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
