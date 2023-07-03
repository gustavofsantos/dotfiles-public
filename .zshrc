# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

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
plugins=(git gh zoxide asdf docker zsh-fzf-history-search)

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

export PATH=$PATH:"$HOME"/.local/bin
export PATH=$PATH:"$HOME"/.bin
export PATH=$PATH:"$HOME"/bin
export PATH=$PATH:"$HOME"/dotfiles-public/bin
export PATH=$PATH:"$HOME"/.emacs.d/bin
export PATH=$PATH:"$HOME"/.config/emacs/bin
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  #tea

## functions
function note () {
  nvim ~/notes/z/$(date +%Y%m%d%H%M%S).md
}
function journal () {
  nvim ~/notes/journal/$(date +%Y-%m-%d).md
}


# alias dev_beyond_test="devcontainer --workspace-folder /opt/loggi/ui exec bash -c 'cd targets/beyond && npm run test -- --bail --coverage=false --watchAll=false'"
function dev_beyond_test() {
  devcontainer exec --workspace-folder /opt/loggi/ui -- bash -c 'cd targets/beyond && npm run test -- --bail --coverage=false --watchAll=false $0'
}

function beyond_last_tags_prod() {
  git --no-pager tag --list 'beyond/prod-2023[0-9][0-9][0-9][0-9].[0-9][0-9]' | tail -n 2 | sed -u -e ':a; N; $!ba; s/\n/\.\./g'
}

function git_local_log() {
  git --no-pager log --pretty=format:"%h%x09%an%x09%ad%x09%s" $1 -- .
}

function beyond_ui_log_pretty_md() {
  git --no-pager log --pretty=format:"%s<%an>" $1 -- . | sd '^(.+)\s\(#([0-9]+)\)<(.+)>$' '* $3 [$1](https://github.com/loggi/ui/pull/$2)'
}

function loggi_web_log_pretty_md() {
  git --no-pager log --pretty=format:"%s<%an>" $1 -- . | sd '^(.+)\s\(#([0-9]+)\)<(.+)>$' '* [$1 ($3)](https://github.com/loggi/loggi-web/pull/$2)'
}

# How to use it
# print_beyond_deploy_info beyond/prod-20230628.01..beyond/prod-20230629.04
function print_beyond_deploy_info() {
  TAG=$(echo $1 | awk -F '\\.\\.' '{ print $2 }')
cat << EOF

Ação: Deploy Beyond UI
Workflow: <replace here>
Tag: https://github.com/loggi/ui/releases/tag/$(echo $TAG | sed 's/\//%2F/g')
Diff: https://github.com/loggi/ui/compare/$1

Pull requests:
$(beyond_ui_log_pretty_md $1)

Descrição:
- 

* https://loggi.sentry.io/issues/?project=5917828&query=is%3Aunresolved+release%3A$(echo $TAG | sed 's/\//-/g')&referrer=issue-list&statsPeriod=14d
* https://grafana.loggi.com/d/TZgxLo8nz/beyond-health?orgId=1

cc @dev-beyond
EOF
}

# Example:
# print_beyond_loggi_web_deploy_info prod-20230627.10/beyond prod-20230621.11/beyond..prod-20230627.10/beyond
function print_beyond_loggi_web_deploy_info() {
cat << EOF

Ação: Deploy Beyond - Loggi Web
Workflow: <replace here>
Tag: https://github.com/loggi/loggi-web/releases/tag/$(echo $1 | sed 's/\//%2F/g')

Pull requests:
$(loggi_web_log_pretty_md $2)

Monitoramento:
* [Sentry Beyond](https://loggi.sentry.io/issues/?project=14082&query=is%3Aunresolved+app_type%3Abeyond+release%3A$(echo $1 | sed 's/\//-/g')&referrer=issue-list&statsPeriod=14d)
* [Grafana Beyond](https://grafana.loggi.com/d/TZgxLo8nz/beyond-health?orgId=1)
EOF
}
# pnpm
export PNPM_HOME="/home/gustavo/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
