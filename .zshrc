
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"

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
  nvim ~/notes/z/$(date +%Y%m%d%H%M%S).md
}
function journal () {
  nvim ~/notes/journal/$(date +%Y-%m-%d).md
}

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

