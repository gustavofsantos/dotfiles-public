function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap Q <Nop>

nmap <silent> K :call ShowDocumentation()<CR>
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr :Telescope coc references<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>ft :Telescope coc diagnostics<CR>
" Search workspace symbols
nnoremap <silent><nowait> <leader>ws  :<C-u>CocList -I symbols<cr>
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

nnoremap ]h :Gitsigns next_hunk<CR>
nnoremap [h :Gitsigns prev_hunk<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <leader><leader> <C-^>
nnoremap <leader>ss :Switch<CR>
nnoremap <leader>dj :Journal<CR>
nnoremap <leader>nn :Note<CR>
nnoremap <leader>tu :terminal lggt %<CR>
nnoremap <leader>tw :terminal lwt %<CR>
nnoremap <leader>tn :TestNearest<CR>

" Toggle nvim tree
nnoremap <C-b> :NvimTreeToggle<CR>

" Delete buffer
nnoremap <C-q> :bdelete<CR>
nnoremap <leader>q :bdelete<CR>

nnoremap <C-t> :exe v:count1 . "ToggleTerm"<CR>
inoremap <C-t> <Esc>:exe v:count1 . "ToggleTerm"<CR>
tnoremap <C-t> <C-\><C-n>:ToggleTerm<CR>

nnoremap <C-p> :Telescope git_files<CR>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-k><C-e> :Telescope oldfiles<CR>
nnoremap <C-k><C-b> :Telescope buffers<CR>
nnoremap <C-k><C-f> :Telescope live_grep<CR>
nnoremap <C-k><C-g> :Git<CR>

nnoremap <leader>fr :lua require('telescope.builtin').resume()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fe :lua require('telescope.builtin').oldfiles()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fm :Telescope harpoon marks<CR>
nnoremap <leader>fj :lua require('telescope.builtin').jumplist()<CR>
nnoremap <leader>fo :lua require('telescope.builtin').loclist()<CR>
nnoremap <leader>fl :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fs :lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <leader>fk :lua require('telescope.builtin').keymaps()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').search_history()<CR>
nnoremap <leader>f? :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fc :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>/  :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

nnoremap <leader>hn :Gitsigns next_hunk<CR>
nnoremap <leader>hp :Gitsigns prev_hunk<CR>
nnoremap <leader>hv :Gitsigns preview_hunk<CR>
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>

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
