local g = vim.g
local cmd = vim.cmd

g.mapleader = " "


cmd [[let g:sneak#label = 1]]
cmd [[let g:sneak#use_ic_scs = 1]]

cmd [[let test#strategy = "neovim"]]

cmd [[
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
]]

cmd [[set termguicolors]]
cmd [[set background=dark]]
cmd [[colorscheme catppuccin]]
cmd [[set noerrorbells]]
cmd [[set tabstop=2 softtabstop=2]]
cmd [[set shiftwidth=2]]
cmd [[set expandtab]]
cmd [[set smartindent]]
cmd [[set vb]]
cmd [[set nowrap]]
cmd [[set smartcase]]
cmd [[set noswapfile]]
cmd [[set cursorline]]
cmd [[set nobackup]]
cmd [[set undodir=~/.config/vim/undodir]]
cmd [[set undofile]]
cmd [[set incsearch]]
cmd [[set switchbuf=useopen]]
cmd [[set cmdheight=1]]
-- cmd [[set colorcolumn=80,100]]
cmd [[set hidden]]
-- cmd [[set foldmethod=expr]]
-- cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
cmd [[set nofoldenable]]
cmd [[set encoding=utf-8]]
cmd [[set nohlsearch]]
-- cmd [[set nu]]
-- cmd [[set number]]
-- cmd [[set relativenumber]]
cmd [[set tags=./tags,.git/tags]]
cmd [[set showtabline=1]]
-- cmd [[set winwidth=100]]
cmd [[set scrolloff=5]]
cmd [[set splitright]]
cmd [[set ignorecase smartcase]]
cmd [[set splitbelow]]
cmd [[set list listchars=tab:»·,trail:·,nbsp:·]]
cmd [[set updatetime=300]]
-- cmd [[set shortmess+=c]]
cmd [[set clipboard+=unnamedplus]]
cmd [[set wildmenu]]
cmd [[set signcolumn=yes]]
cmd [[set pumheight=10]]
cmd [[set grepprg=ag]]
cmd [[set wildmode=list:longest,full]]
-- Nvim global statusline
-- cmd [[set laststatus=3]]

cmd [[set backupdir=~/.tmp]]
cmd [[set directory=~/.tmp]]
cmd [[set guioptions-=T]]
cmd [[set guifont=MonoLisaCustom\ Nerd\ Font:h12]]

cmd [[set mouse=nv]]

cmd [[set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)]]

cmd [[
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
]]

cmd [[command! Q q]]
cmd [[command! Qall qall]]
cmd [[command! QA qall]]
cmd [[command! E e]]
cmd [[command! W w]]
cmd [[command! Reload :luafile ~/.config/nvim/init.lua<CR>]]
cmd [[command! Format :!npx prettier -w %<CR>]]
cmd [[command! Worklog :tabnew | :e ~/notes/loggi/worklog.md]]
cmd [[command! Journal :lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>]]
cmd [[command! Note :lua vim.cmd(string.format("tabnew ~/notes/z/%s.md", os.date("%Y%m%d%H%M%S")))<CR>]]
cmd [[command! Todo :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [ ]' })<CR>]]
cmd [[command! Doing :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [-]' })<CR>]]
cmd [[command! Done :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- [x]' })<CR>]]

-- Run the current test file
cmd [[command! LWT :lua require('toggleterm').exec("lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", ""))]]
cmd [[command! LGGT :lua require('toggleterm').exec("lggt " .. vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:t"))]]

cmd [[
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]]

-- cmd [[highlight ExtraWhitespace ctermbg=1 guibg=red]]
-- cmd [[highlight Comment cterm=italic term=italic gui=italic]]
-- cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
-- cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsClassProperty cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsThis cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsNull cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsUndefined cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsExport cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsImport cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsFrom cterm=italic term=italic gui=italic]]
-- cmd [[highlight jsObjectKeyString cterm=italic term=italic gui=italic]]

cmd [[match ExtraWhitespace /\s\+$/]]
cmd [[autocmd BufWinEnter * match ExtraWhitespace /\s\+$/]]
cmd [[autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/]]
cmd [[autocmd InsertLeave * match ExtraWhitespace /\s\+$/]]
cmd [[autocmd BufWinLeave * call clearmatches()]]
cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

cmd [[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
augroup END
]]

cmd [[
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END
]]
