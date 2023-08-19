set fish_greeting ""

set -gx EDITOR nvim

set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/bin $PATH

set -g theme_display_jobs_verbose yes

# Aliases
alias v "nvim"
alias vim "nvim"
alias jest "npx jest"
alias prisma "npx prisma"
alias rt "npm run test"
alias g="git"
alias zl="zellij"

alias emacs "emacsclient -c -a 'emacs'"
alias em "emacs -nw"

# Loggi aliases
# alias lggt "npm run test -- --bail --maxWorkers=2 --watchAll=false --coverage=false"
alias lggw "npm run test -- --bail --maxWorkers=2 --coverage=false"
alias lglt "npx eslint (git diff --relative --name-only HEAD | grep -E '\.jsx?\$' | xargs)"
alias ui_review="gh pr list -S 'is:pr is:open user-review-requested:@me label:beyond-conversao' | fzf --preview 'gh pr view {1}' --preview-window down | awk '{print $1}' | xargs gh pr checkout"
alias lwt "docker-compose exec -e DJANGO_SETTINGS_MODULE=settings.test loggi_web_app pytest -vv"
alias lw_diff "git diff -U0 master...HEAD '*.py'"
alias lw_diff_files "git diff --name-only master...HEAD '*.py'"
alias lw_format "lw_diff | ~/loggi/web/ops/black.sh fix"
alias lw_lint "lw_diff | flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check"
alias lw_lint_watch "lw_diff_files | SHELL=/bin/bash entr -s 'flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check'"
alias lw_auth="sh ~/dotfiles/bash_scripts/lw_auth.sh"
alias lw_migrate "docker-compose exec loggi_web_app bash -c './manage.py migrate'"
alias lw_test_urls "docker-compose exec loggi_web_app bash -c 'python manage.py validate_urls && printf \"\n✅ All right with unitary tests for URLs\n\n\" && exit 0 || printf \"\n⚠️  Problem with tests for URLs.\nPlease check the messages above to fix the problem with the tests.\nGood reading: https://loggidev.atlassian.net/wiki/spaces/SI/pages/1351418174/Testing+URI+on+Loggi-web\n\n\" && exit 1'"
alias lw_show_urls "docker-compose exec loggi_web_app bash -c 'python manage.py show_urls'"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gustavo/anaconda3/bin/conda
    eval /home/gustavo/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

zoxide init fish | source
