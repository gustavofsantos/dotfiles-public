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
  use 'sainnhe/sonokai'
  use 'kaiuri/nvim-juliana'
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'

  use 'mbbill/undotree' -- tree of changes

  -- use 'sheerun/vim-polyglot'
  use 'yuezk/vim-js' -- JavaScript highlight
  use 'HerringtonDarkholme/yats.vim' -- TypeScript highlight
  use 'maxmellon/vim-jsx-pretty' -- JSX highlight
  use 'numirias/semshi' -- Better Python highlight
  use 'pantharshit00/vim-prisma' -- Prisma files colorscheme
  use 'norcalli/nvim-colorizer.lua' -- Display colors

  use 'tpope/vim-surround'

  -- Git
  use 'TimUntersberger/neogit'
  use { 'akinsho/git-conflict.nvim', tag = "*" }

  use 'numToStr/Comment.nvim'
  use 'justinmk/vim-sneak'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'

  use 'ThePrimeagen/harpoon'

  -- IDE like view
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'

  use 'akinsho/toggleterm.nvim'

  use 'folke/trouble.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use 'gbprod/yanky.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Completion
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
end)
