call plug#begin()
" Neovim plugins
Plug 'kevinhwang91/promise-async'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rktjmp/lush.nvim'

Plug 'rockyzhang24/arctic.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'lifepillar/vim-solarized8'
Plug 'ishan9299/modus-theme-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'loctvl842/monokai-pro.nvim'

Plug 'jxnblk/vim-mdx-js'

Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.6' }
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'run': 'make' }
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'nvim-treesitter/playground'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'akinsho/toggleterm.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'Olical/conjure'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/switch.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-test/vim-test'
Plug 'github/copilot.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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
" colorscheme arctic
colorscheme monokai-pro
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
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
set tags=./tags,.git/tags
set showtabline=1
set scrolloff=5
set laststatus=2
set splitright
set ignorecase smartcase
set splitbelow
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

command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq
command! WQ wq
command! Reload :source ~/.config/nvim/init.vim<CR>
command! Format :terminal npx prettier -w %:p<CR>
command! Worklog :tabnew | :e ~/notes/loggi/worklog.md
if has('nvim')
  command! Config :e ~/.config/nvim/init.vim<CR>
  command! Journal :lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>
  command! Note :lua vim.cmd(string.format("tabnew ~/notes/z/%s.md", os.date("%Y%m%d%H%M%S")))<CR>
  command! Todo :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [ ]' })<CR>
  command! Doing :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [-]' })<CR>
  command! Done :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [x]' })<CR>
  command! LWT :lua require('toggleterm').exec("lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", ""))
  command! LGGT :lua require('toggleterm').exec("lggt " .. vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:t"))
  command! LGGW :lua require('toggleterm').exec("lggw " .. vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:t"))
  command! PlaywrightDebug :lua require('toggleterm').exec("npx playwright test " .. vim.fn.expand("%:t") .. " --debug" )
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>


  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  augroup END
endif

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
highlight! default link CmpItemKind CmpItemMenuDefault


augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END

source ~/.config/nvim/mappings.vim
" lua require('mappings')
