" let g:test#strategy = 'vtr'
let g:test#python#runner = 'pytest'
let g:test#python#pytest#executable = 'py-test-file'

nnoremap <leader>pi :!bash -c "py-isort %:p"<CR>
nnoremap <leader>pic :!bash -c "py-isort-check %:p"<CR>
nnoremap <leader>pb :!bash -c "py-black %:p"<CR>
nnoremap <leader>pbc :!bash -c "py-black-check %:p"<CR>
nnoremap <leader>pt :T bash -c "py-test-file %:t && echo 'Success' \| espeak \|\| echo 'Fail' \| espeak"<CR>

set colorcolumn=100
