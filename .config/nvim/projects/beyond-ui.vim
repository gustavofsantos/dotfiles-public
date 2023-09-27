function! EscapeTransform(cmd)
    return shellescape(a:cmd)
endfunction

function! EscapeSingleQuotes(cmd)
    let escaped = substitute(a:cmd, "'", "\\'", "g")
    return substitute(escaped, '-- ', '', '')
endfunction

let g:test#custom_transformations = {'escape': function('EscapeSingleQuotes')}

" let g:test#transformation = 'escape'
" let g:test#javascript#runner = 'jest'
" let g:test#javascript#jest#executable = 'lggt'

augroup SetVimTestGlobalVariablesForJest
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile *.test.js let g:test#transformation = 'escape'
    autocmd BufEnter,BufRead,BufNewFile *.test.js let g:test#javascript#runner = 'jest'
    autocmd BufEnter,BufRead,BufNewFile *.test.js let g:test#javascript#jest#executable = 'lggt'
augroup END

augroup SetVimTestGlobalVariablesForPlaywright
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile *.spec.js let g:test#javascript#runner = 'playwright'
    autocmd BufEnter,BufRead,BufNewFile *.spec.js let g:test#javascript#playwright#executable = 'env $(cat .env.local .env.test.local | grep -v ^#) npx playwright test'
augroup END

augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END
