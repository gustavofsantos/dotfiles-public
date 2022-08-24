local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')
if (not packer) then return end

return packer.startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- utilities
  use 'rktjmp/lush.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- colorscheme
  use 'rebelot/kanagawa.nvim'

  use 'mbbill/undotree' -- tree of changes

  use 'sheerun/vim-polyglot'
  use 'pantharshit00/vim-prisma' -- Prisma files colorscheme
  use 'norcalli/nvim-colorizer.lua' -- Display colors

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'numToStr/Comment.nvim'
  use 'justinmk/vim-sneak'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'ThePrimeagen/harpoon'
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'akinsho/toggleterm.nvim'
  use 'folke/trouble.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use 'gbprod/yanky.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
end)
