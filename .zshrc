export HISTFILE=$HOME/.zsh_history
export HISTTIMEFORMAT="[%F %T] "
export SAVEHIST=1000
export HISTSIZE=999

if [[ $(uname -n) = "loggi" ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"


  export POETRY_VERSION=1.2.2
  export POETRY_HOME="/opt/poetry"
  export PATH="$POETRY_HOME/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## functions
function note () {
  nvim $NOTES_HOME/$(date +%Y%m%d%H%M%S).md
}
function journal () {
  nvim $JOURNALS_HOME/$(date +%Y-%m-%d).md
}

eval "$(sheldon source)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# # Initialize zsh completions (added by deno install script)
# autoload -Uz compinit
# compinit


function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}


alias drmid=drmid-fn
