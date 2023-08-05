# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH=/home/gustavo/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="minimal"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  brew
  nvm
  npm
  docker
  tmux
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  bashmarks
  npm
  nvm
  zoxide
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias bashconfig="nvim ~/.bashrc"
alias dotfiles="nvim ~/dotfiles-public/README.md"
alias vimrc="nvim ~/.vimrc"
alias alacritty_config="nvim ~/dotfiles-public/.config/alacritty/alacritty.yml"

alias v="nvim"
alias vim="nvim"
alias jest="npx jest"
alias prisma="npx prisma"
alias rt="npm run test"

alias emacs="emacsclient -c -a 'emacs'"
alias em="emacs -nw"

# Loggi aliases
alias lggt="npm run test -- --coverage=false"
alias lglt="npx eslint $(git diff --relative --name-only HEAD | grep -E '\.jsx?$' | xargs)"
alias lw_diff="git diff -U0 master...HEAD '*.py'"
alias lw_diff_files="git diff --name-only master...HEAD '*.py'"
alias lw_format="lw_diff | ~/loggi/web/ops/black.sh fix"
alias lw_lint="lw_diff | flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check"
alias lw_lint_watch="lw_diff_files | SHELL=/bin/bash entr -s 'flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check'"
alias lw_auth="sh ~/dotfiles/bash_scripts/lw_auth.sh"

# Run tests
# Example: lwt tests/bla/bla
alias lwt="docker-compose exec -e DJANGO_SETTINGS_MODULE=settings.test loggi_web_app pytest -vv"

# Apply migrations
alias lw_migrate="docker-compose exec loggi_web_app bash -c './manage.py migrate'"

alias lw_test_urls="docker-compose exec loggi_web_app bash -c 'python manage.py validate_urls && printf \"\n✅ All right with unitary tests for URLs\n\n\" && exit 0 || printf \"\n⚠️  Problem with tests for URLs.\nPlease check the messages above to fix the problem with the tests.\nGood reading: https://loggidev.atlassian.net/wiki/spaces/SI/pages/1351418174/Testing+URI+on+Loggi-web\n\n\" && exit 1'"
alias lw_show_urls="docker-compose exec loggi_web_app bash -c 'python manage.py show_urls'"

# -----

# Git aliases
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

# TMUX aliases
alias trename="tmux rename-session"

# alias emacs="emacs -nw"

alias ls="exa -F"
alias ll="exa -l"
alias tree="exa -T"

alias cat="bat"

alias gogh="bash -c  \"\$(wget -qO- https://git.io/vQgMr)\""

export PATH=$PATH:"$HOME"/.local/bin
# export PATH=$PATH:"$HOME"/dotfiles/bash_scripts
export PATH=$PATH:"$HOME"/.emacs.d/bin

# if [ -e /home/gustavo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gustavo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [[ $(uname -n) = "loggi" ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# . "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gustavo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gustavo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gustavo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gustavo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

