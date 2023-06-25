call plug#begin()
" Neovim plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Themes
Plug 'rockyzhang24/arctic.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'kvrohit/rasmus.nvim'
Plug 'ishan9299/modus-theme-vim'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'rmehri01/onenord.nvim'

Plug 'jxnblk/vim-mdx-js'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lualine/lualine.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.6' }
Plug 'sindrets/diffview.nvim'

" Navigation
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'run': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ThePrimeagen/harpoon'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'akinsho/toggleterm.nvim'
Plug 'mbbill/undotree'

" Code editing
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'nvim-treesitter/playground'
Plug 'kevinhwang91/nvim-ufo'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/switch.vim'
Plug 'justinmk/vim-sneak'

" Running tests
Plug 'vim-test/vim-test'

" LSP & autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'glepnir/lspsaga.nvim', {'tag': 'v0.2.9'}
Plug 'onsails/lspkind.nvim'
Plug 'github/copilot.vim'

call plug#end()

source ~/.config/nvim/lua/themes.lua

let mapleader = " "
let maplocalleader = " "

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

let test#strategy = "neovim"
let test#javascript#playwright#options = "--headed"

let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(.*\)TODO\(.*\)$': '\1DOING\2',
    \     '^\(.*\)DOING\(.*\)$': '\1DONE\2',
    \     '^\(.*\)DONE\(.*\)$': '\1TODO\2',
    \     '^\(.*\)\[ \]\(.*\)$': '\1\[-\]\2',
    \     '^\(.*\)\[-\]\(.*\)$': '\1\[x\]\2',
    \     '^\(.*\)\[x\]\(.*\)$': '\1\[ \]\2',
    \   }
    \ ]

set termguicolors
set background=dark
" colorscheme kanagawa
colorscheme nordic
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set winwidth=80
set smartindent
set vb
set nowrap
set smartcase
set noswapfile
set cursorline
set nobackup
set undodir=~/.config/vim/undodir
set undofile
set incsearch
set autoread
set switchbuf=useopen
set cmdheight=1
set hidden
set nofoldenable
set encoding=utf-8
set nohlsearch
set number
set relativenumber
set colorcolumn=80,100
set tags=./tags,.git/tags
set showtabline=1
set scrolloff=5
set laststatus=2
set splitright
set ignorecase smartcase
set splitbelow
set t_ti= t_te=
set updatetime=100
set clipboard+=unnamedplus
set wildmenu
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set pumheight=10
set grepprg=ag
set wildmode=list:longest,full
set backupdir=~/.tmp
set directory=~/.tmp
set guioptions-=T
set mouse=nv
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

source ~/.config/nvim/mappings.vim
