# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"
# ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gh zoxide asdf docker)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export EDITOR='nvim'

alias v="nvim"
alias vim="nvim"
alias jest="npx jest"
alias prisma="npx prisma"
alias rt="npm run test"

alias emacs="emacsclient -c -a 'emacs'"
alias em="emacs -nw"

# Loggi aliases
alias lggt="npm run test -- --bail --coverage=false --watchAll=false"
# alias lglt="npx eslint $(git diff --relative --name-only HEAD | grep -E '\.jsx?$' | xargs)"
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

alias lw_test_urls="docker-compose exec loggi_web_app bash -c 'python manage.py validate_urls && printf \"\n??? All right with unitary tests for URLs\n\n\" && exit 0 || printf \"\n??????  Problem with tests for URLs.\nPlease check the messages above to fix the problem with the tests.\nGood reading: https://loggidev.atlassian.net/wiki/spaces/SI/pages/1351418174/Testing+URI+on+Loggi-web\n\n\" && exit 1'"
alias lw_show_urls="docker-compose exec loggi_web_app bash -c 'python manage.py show_urls'"

# -----

# Git aliases
alias g="git"

# TMUX aliases
alias trename="tmux rename-session"

alias ..="cd .."

alias ll="ls -lhF --color"
alias la="ls -lahF --color"
alias lsd="ls -lhF --color | grep --color=never '^d'"

alias gogh="bash -c  \"\$(wget -qO- https://git.io/vQgMr)\""

export PATH=$PATH:"$HOME"/.local/bin
export PATH=$PATH:"$HOME"/.bin
export PATH=$PATH:"$HOME"/dotfiles-public/bin
export PATH=$PATH:"$HOME"/.emacs.d/bin
# export PATH="/home/linuxbrew/.linuxbrew/opt/node@18/bin:$PATH"

eval "$(zoxide init zsh)"

if [[ $(uname -n) = "loggi" ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"


  export POETRY_VERSION=1.1.8
  export POETRY_HOME="/opt/poetry"
  export PATH="$POETRY_HOME/bin:$PATH"
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  #tea
