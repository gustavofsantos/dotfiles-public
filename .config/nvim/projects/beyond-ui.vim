function! VagrantTransform(cmd) abort
  " let vagrant_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  " print the `cmd` to the terminal
  echo a:cmd
  return 'blah'
endfunction

let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}

let g:test#transformation = 'vagrant'
let g:test#strategy = 'neovim'
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#executable = 'lggt'

echo "loading beyond-ui.vim"
