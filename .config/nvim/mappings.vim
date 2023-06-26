nmap Q <Nop>

" goodies
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
nnoremap <C-q> :q<CR>
imap <C-e> <C-o>$
imap <C-a> <C-o>^
inoremap <C-c> <Esc>:wq<CR>
nnoremap <C-c> :wq<CR>

nnoremap zR :lua require('ufo').openAllFolds()<CR>
nnoremap zM :lua require('ufo').closeAllFolds()<CR>

nnoremap <leader>am :lua require('harpoon.mark').add_file()<CR>
nnoremap <leader>]m :lua require('harpoon.ui').nav_next()<CR>
nnoremap <leader>[m :lua require('harpoon.ui').nav_prev()<CR>
" nnoremap <leader>fm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>f1 :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <leader>f2 :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <leader>f3 :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <leader>f4 :lua require('harpoon.ui').nav_file(4)<CR>


tnoremap <Esc> <C-\><C-n>
nnoremap <leader><leader> <C-^>
nnoremap <leader>ss :Switch<CR>
nnoremap <leader>dj :Journal<CR>
nnoremap <leader>nn :Note<CR>
nnoremap <leader>tu :terminal lggt %<CR>
nnoremap <leader>tw :terminal lwt %<CR>
nnoremap <leader>tn :TestNearest<CR>

" execute current file as a script
nnoremap <leader>x :!%:p<CR>

" Toggle nvim tree
" nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-b> :Telescope file_browser path=%:p:h select_buffer=true<CR>
nnoremap <leader>b :Telescope file_browser path=%:p:h select_buffer=true<CR>

nnoremap <leader>q :bdelete<CR>

nnoremap <leader>tw :!tmux neww -n "󰙨" "lggw %"<CR>

nnoremap <A-t> :exe v:count1 . "ToggleTerm"<CR>
inoremap <A-t> <Esc>:exe v:count1 . "ToggleTerm"<CR>
tnoremap <A-t> <C-\><C-n>:ToggleTerm<CR>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-k><C-e> :Telescope oldfiles<CR>
nnoremap <C-k><C-b> :Telescope buffers<CR>
nnoremap <C-k><C-f> :Telescope live_grep<CR>
" nnoremap <C-k><C-g> :Git<CR>

nnoremap <leader>fr :lua require('telescope.builtin').resume()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fe :lua require('telescope.builtin').oldfiles()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fm :Telescope harpoon marks<CR>
nnoremap <leader>fj :lua require('telescope.builtin').jumplist()<CR>
nnoremap <leader>fo :lua require('telescope.builtin').loclist()<CR>
nnoremap <leader>fl :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fs :lua require('telescope.builtin').lsp_document_symbols()<cr>
" nnoremap gr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fk :lua require('telescope.builtin').keymaps()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').search_history()<CR>
nnoremap <leader>f? :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fc :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>/  :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

nnoremap ]h :Gitsigns next_hunk<CR>
nnoremap [h :Gitsigns prev_hunk<CR>
nnoremap <leader>hv :Gitsigns preview_hunk<CR>
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>
" nnoremap <leader>gs :Git<CR>
vnoremap <leader>b :<C-U>!git blame <C-R>=expand(\"%:p\") <CR> \| sed -n <C-R>=line(\"'<\") <CR>,<C-R>=line(\"'>\") <CR>p <CR>

" split vertically
nnoremap <C-w>s :vsplit<CR>
nnoremap <C-w><C-s> :vsplit<CR>
nnoremap <leader>ws :vsplit<CR>
" split horizontally
nnoremap <C-w>S :split<CR>
nnoremap <leader>wS :split<CR>

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move tabs
nnoremap <A-h> :-tabmove<CR>
nnoremap <A-l> :+tabmove<CR>

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
command! Config :e ~/.config/nvim/init.vim<CR>
command! Journal :lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>
command! Note :lua vim.cmd(string.format("tabnew ~/notes/z/%s.md", os.date("%Y%m%d%H%M%S")))<CR>
command! Todo :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- TODO' })<CR>
command! Doing :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- DOING' })<CR>
command! Done :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- DONE' })<CR>
command! LWT :lua require('toggleterm').exec("lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", ""))
" command! LWT :lua vim.cmd("!tmux new-window -d -n '' 'lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", "") .. "'; read")
command! LGGT :lua require('toggleterm').exec("lggt " .. vim.fn.expand("%"))
command! LGGW :lua require('toggleterm').exec("lggw " .. vim.fn.expand("%"))
command! LWTX :lua io.popen("tmux neww -n '󰙨' '" .. "lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", "") .. " && read'")
command! LGGTX :!tmux neww -n "󰙨" "lggt % && read"
command! LGGWX :!tmux neww -n "󰙨" "lggw %"
command! PlaywrightDebug :lua require('toggleterm').exec("npx playwright test " .. vim.fn.expand("%:t") .. " --debug" )
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>


augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
augroup END

" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
" highlight! default link CmpItemKind CmpItemMenuDefault


augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END
