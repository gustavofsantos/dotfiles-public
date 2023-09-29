let mapleader = " "
let maplocalleader = " "

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

let test#strategy = "vtr"
let test#javascript#playwright#options = "--headed --retries 0"

let g:rasmus_italic_comments = 1
let g:rasmus_italic_functions = 1
let g:rasmus_bold_booleans = 1

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

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'stevearc/dressing.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'echasnovski/mini.hipatterns'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'

" Themes
Plug 'rebelot/kanagawa.nvim'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-conflicted'
Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.6' }

" Navigation
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Code editing
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/switch.vim'
Plug 'justinmk/vim-sneak'
Plug 'echasnovski/mini.move'
Plug 'echasnovski/mini.splitjoin'
Plug 'echasnovski/mini.bracketed'

" Running tests
Plug 'vim-test/vim-test'

" LSP & autocomplete
Plug 'folke/neodev.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'echasnovski/mini.completion', { 'branch': 'stable' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/trouble.nvim'
Plug 'github/copilot.vim'
Plug 'stevearc/conform.nvim'
Plug 'mfussenegger/nvim-lint'

Plug 'windwp/nvim-projectconfig'

call plug#end()

source ~/.config/nvim/lua/themes.lua
source ~/.config/nvim/lua/project.lua

set termguicolors
set background=dark
" set noerrorbells
set tabstop=2 softtabstop=2
" set shiftwidth=2
" set expandtab
" set winwidth=80
set smartindent
" set vb
set nowrap
set smartcase
set noswapfile
set cursorline
set nobackup
set undodir=~/.config/vim/undodir
set undofile
set incsearch
" set autoread
set switchbuf=useopen
set cmdheight=1
set hidden
set hlsearch
set encoding=utf-8
set foldmethod=indent
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
" set t_ti= t_te=
set updatetime=100
set clipboard+=unnamedplus
set wildmenu
" set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set pumheight=10
" set grepprg=ag
set wildmode=list:longest,full
set backupdir=~/.tmp
set directory=~/.tmp
" set guioptions-=T
set mouse=nv
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set statusline+=%{ConflictedVersion()}
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/lua/testing.lua
