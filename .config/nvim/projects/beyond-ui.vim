function! EscapeTransform(cmd)
    return shellescape(a:cmd)
endfunction

function! EscapeSingleQuotes(cmd)
    let escaped = substitute(a:cmd, "'", "\\'", "g")
    return substitute(escaped, '-- ', '', '')
endfunction

let g:test#custom_transformations = {'escape': function('EscapeSingleQuotes')}

let g:test#transformation = 'escape'
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#executable = 'lggt'

function! TestNearestPlaywright()
    let test#javascript#runner = 'playwright'
    let test#javascript#jest#executable = 'cat $(.env.local .env.test.local) npx playwright test'
    TestNearest
endfunction

echo "loading beyond-ui.vim"
