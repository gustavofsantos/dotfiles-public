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
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'ellisonleao/gruvbox.nvim'
  use 'loctvl842/monokai-pro.nvim'
  use 'rmehri01/onenord.nvim'

  use 'mbbill/undotree' -- tree of changes

  -- use 'sheerun/vim-polyglot'
  -- use 'yuezk/vim-js' -- JavaScript highlight
  use 'HerringtonDarkholme/yats.vim' -- TypeScript highlight
  -- use 'maxmellon/vim-jsx-pretty' -- JSX highlight
  use 'mustache/vim-mustache-handlebars' -- handlebars highlight
  use 'pantharshit00/vim-prisma' -- Prisma files colorscheme
  use 'udalov/kotlin-vim' -- Kotlin highlight
  use 'elixir-editors/vim-elixir' -- Elixir highlighting
  -- use 'numirias/semshi' -- Python enhanced syntax
  use 'norcalli/nvim-colorizer.lua' -- Display colors

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'AndrewRadev/switch.vim'
  use 'justinmk/vim-sneak'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'



  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'ThePrimeagen/harpoon'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'nvim-treesitter/playground'
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use 'lukas-reineke/headlines.nvim'

  -- IDE like view
  -- use 'kyazdani42/nvim-tree.lua'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use 'nvim-lualine/lualine.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'mfussenegger/nvim-dap'
  use 'akinsho/toggleterm.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  }
  -- LSP updates
  use 'j-hui/fidget.nvim'

  -- use 'jose-elias-alvarez/null-ls.nvim'

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
