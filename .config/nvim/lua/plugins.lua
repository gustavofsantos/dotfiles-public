local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')
if (not packer) then return end

return packer.startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  use 'mbbill/undotree' -- tree of changes
  use 'mustache/vim-mustache-handlebars' -- handlebars highlight
  use 'pantharshit00/vim-prisma' -- Prisma files colorscheme
  use 'udalov/kotlin-vim' -- Kotlin highlight
  use 'elixir-editors/vim-elixir' -- Elixir highlighting
  use 'norcalli/nvim-colorizer.lua' -- Display colors
  -- Snippets
end)
