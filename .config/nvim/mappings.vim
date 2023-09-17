nmap Q <Nop>

" save current buffer
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" close current buffer
nnoremap <C-q> :q<CR>
" go to the end of the line
imap <C-e> <C-o>$
" go to the beginning of the line
imap <C-a> <C-o>^
map <C-c> <Esc>

noremap <ESC> :noh<CR><ESC>

map <C-c> <Esc>

nnoremap <leader>am :lua require('harpoon.mark').add_file()<CR>
nnoremap <leader>]m :lua require('harpoon.ui').nav_next()<CR>
nnoremap <leader>[m :lua require('harpoon.ui').nav_prev()<CR>
" nnoremap <leader>fm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>f1 :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <leader>f2 :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <leader>f3 :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <leader>f4 :lua require('harpoon.ui').nav_file(4)<CR>

" git conflict mappings
nnoremap gj <cmd>diffget //3<CR>
nnoremap gf <cmd>diffget //2<CR>
autocmd FileType gitcommit    nnoremap <buffer> <C-c> :wq<CR>
autocmd FileType gitcommit    inoremap <buffer> <C-c> <esc>:wq<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <leader><leader> <C-^>
nnoremap <leader>ss :Switch<CR>
nnoremap <leader>dj :Journal<CR>
nnoremap <leader>nn :Note<CR>
nnoremap <leader>tu :terminal lggt %<CR>
nnoremap <leader>tw :terminal lwt %<CR>

" execute current file as a script
nnoremap <leader>run :!%:p<CR>

nnoremap <leader>tw :!tmux neww -n "󰙨" "lggw %"<CR>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-b> :Telescope file_browser path=%:p:h select_buffer=true<CR>

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
" nnoremap <leader>tn :lua require("neotest").run.run()<CR>
" nnoremap <leader>tf :lua require("neotest").run.run(vim.fn.expand("%"))<CR>
" nnoremap <leader>tl :lua require("neotest").run.run_last()<CR>
" nnoremap <leader>ts :lua require("neotest").summary.toggle()<CR>

nnoremap <leader>fr :lua require('telescope.builtin').resume()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fe :lua require('telescope.builtin').oldfiles()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fm :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>fj :lua require('telescope.builtin').jumplist()<CR>
nnoremap <leader>fo :lua require('telescope.builtin').loclist()<CR>
nnoremap <leader>fl :lua require('telescope.builtin').live_grep()<CR>
" nnoremap gr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fk :lua require('telescope.builtin').keymaps()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').search_history()<CR>
nnoremap <leader>f? :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fc :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>/  :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

nnoremap <leader>xx <cmd>TroubleToggle<CR>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<CR>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<CR>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>

nnoremap ]h :Gitsigns next_hunk<CR>
nnoremap [h :Gitsigns prev_hunk<CR>
nnoremap gH :Gitsigns preview_hunk<CR>
nnoremap <leader>hp :Gitsigns preview_hunk<CR>
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>
nnoremap <leader>gs :Git<CR>
vnoremap <leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" split vertically
nnoremap <C-w>s :vsplit<CR>
nnoremap <C-w><C-s> :vsplit<CR>
" split horizontally
nnoremap <C-w>S :split<CR>
nnoremap <leader>wS :split<CR>
" move splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
command! Wa wa
command! WA wa
command! Reload :source ~/.config/nvim/init.vim<CR>
command! Worklog :vsp | :e ~/notes/worklog.md
command! Config :e ~/.config/nvim/init.vim<CR>
command! Journal :lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>
command! Note :lua vim.cmd(string.format("tabnew ~/notes/z/%s.md", os.date("%Y%m%d%H%M%S")))<CR>
command! Todo :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- TODO' })<CR>
command! Doing :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- DOING' })<CR>
command! Done :lua require('telescope.builtin').grep_string({ cwd = '~/notes', search = '- DONE' })<CR>
" command! LWT :lua require('toggleterm').exec("lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", ""))
" command! LWT :lua vim.cmd("!tmux new-window -d -n '' 'lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", "") .. "'; read")
" command! LGGT :lua require('toggleterm').exec("lggt " .. vim.fn.expand("%"))
" command! LGGW :lua require('toggleterm').exec("lggw " .. vim.fn.expand("%"))
command! BPY :!docker run -v /opt/loggi/py/apps/beyond/src/beyond_app:/opt/loggi/beyond/src/beyond_app beyond-py bash -c 'poetry run py.test --disable-warnings -vv --ds beyond_app.settings.development -k %:t src/beyond_app'<CR>
command! LGGT :!lggt %<CR>
command! LGGW :!lggw %<CR>
command! LWTX :lua io.popen("tmux neww -n '󰙨' '" .. "lwt " .. string.gsub(vim.fn.expand("%"), "loggi/", "") .. " & while [ : ]; do sleep 1; done'")
command! LGGTX :silent !tmux neww -d -n "󰙨" "lggt % && echo 'Success' | espeak || echo 'Fail' | espeak & read"
command! LGGWX :silent !tmux neww -d -n "󰙨" "lggw % & while [ : ]; do sleep 1; done"
command! PlaywrightDebug :lua require('toggleterm').exec("npx playwright test " .. vim.fn.expand("%:t") .. " --debug" )

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
augroup END

" Loggi's py monorepo
nnoremap <leader>pi :!bash -c "py-isort %:p"<CR>
nnoremap <leader>pic :!bash -c "py-isort-check %:p"<CR>
nnoremap <leader>pb :!bash -c "py-black %:p"<CR>
nnoremap <leader>pbc :!bash -c "py-black-check %:p"<CR>
nnoremap <leader>pt :T bash -c "py-test-file %:t && echo 'Success' \| espeak \|\| echo 'Fail' \| espeak"<CR>

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

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
