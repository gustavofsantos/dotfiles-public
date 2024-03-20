" let g:test#strategy = 'vtr'
let g:test#python#runner = 'pytest'
let g:test#python#pytest#options = '--disable-warnings -vv --ds beyond_app.settings.test'
" let g:test#python#pytest#executable = 'py-test-file'

nnoremap <leader>pi :!bash -c "py-isort %:p"<CR>
nnoremap <leader>pic :!bash -c "py-isort-check %:p"<CR>
nnoremap <leader>pb :!bash -c "py-black %:p"<CR>
nnoremap <leader>pbc :!bash -c "py-black-check %:p"<CR>
" nnoremap <leader>pt :T bash -c "py-test-file %:t && echo 'Success' \| espeak \|\| echo 'Fail' \| espeak"<CR>

" nnoremap <leader>tn :TestNearest POSTGRES_DB=dev_db POSTGRES_PASSWORD=postgres POSTGRES_HOST=localhost POSTGRES_PORT=5432<CR>
" nnoremap <leader>tf :TestFile POSTGRES_DB=dev_db POSTGRES_PASSWORD=postgres POSTGRES_HOST=localhost POSTGRES_PORT=5432<CR>

" set colorcolumn=100
