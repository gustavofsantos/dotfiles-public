if [ -e /home/gustavo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gustavo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /home/gustavo/.cargo/env ]; then . /home/gustavo/.cargo/env;  fi
if [ -e /home/gustavo/.asdf/asdf.sh ]; then . /home/gustavo/.asdf/asdf.sh; fi

alias v="nvim"
alias vim="nvim"
alias jest="npx jest"
alias prisma="npx prisma"
alias rt="npm run test"
alias emacs="emacsclient -c -a 'emacs'"
alias em="emacs -nw"
alias wez="flatpak run org.wezfurlong.wezterm"
alias g="git"
alias trename="tmux rename-session"
alias ..="cd .."
alias ll="ls -lhF --color"
alias la="ls -lahF --color"
alias lsd="ls -lhF --color | grep --color=never '^d'"
alias gogh="bash -c  \"\$(wget -qO- https://git.io/vQgMr)\""

# Loggi aliases
alias lwt="docker-compose exec -e DJANGO_SETTINGS_MODULE=settings.test loggi_web_app pytest -vv"
alias bpy="docker run -v $(pwd)/src/beyond_app:/opt/loggi/beyond/src/beyond_app beyond-py bash -c 'poetry run py.test --disable-warnings -vv --ds beyond_app.settings.development src/beyond_app'"
alias lwt_tmux="tmux new-window -d -n '' lwt "
# alias lggt="npm run test -- --bail --coverage=false --maxWorkers=2 --watchAll=false"
alias lggw="npm run test -- --bail --coverage=false"
alias lglt="git diff --relative --name-only HEAD | grep -E '.jsx?$' | xargs ./../../node_modules/.bin/eslint --fix"
alias bui_commit="lglt && git commit"
alias lw_diff="git diff -U0 master...HEAD '*.py'"
alias lw_diff_files="git diff --name-only master...HEAD '*.py'"
alias lw_format="docker-compose exec loggi_web_app bash -c 'cd .. && ./ops/black.sh fix'"
alias lw_lint="lw_diff | flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check"
alias lw_lint_watch="lw_diff_files | SHELL=/bin/bash entr -s 'flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check'"
alias lw_auth="sh ~/dotfiles/bash_scripts/lw_auth.sh"
alias lw_migrate="docker-compose exec loggi_web_app bash -c './manage.py migrate'"
alias lw_test_urls="docker-compose exec loggi_web_app bash -c 'python manage.py validate_urls && printf \"\n✅ All right with unitary tests for URLs\n\n\" && exit 0 || printf \"\n⚠️  Problem with tests for URLs.\nPlease check the messages above to fix the problem with the tests.\nGood reading: https://loggidev.atlassian.net/wiki/spaces/SI/pages/1351418174/Testing+URI+on+Loggi-web\n\n\" && exit 1'"
alias lw_show_urls="docker-compose exec loggi_web_app bash -c 'python manage.py show_urls'"
alias dev_beyond="devcontainer --workspace-folder /opt/loggi/ui exec bash -c 'cd targets/beyond && npm start'"
alias dev_beyond_test_watch="devcontainer --workspace-folder /opt/loggi/ui exec bash -c 'cd targets/beyond && npm run test -- --bail --coverage=false'"
alias ui_review="gh pr list -S 'is:pr is:open user-review-requested:@me label:beyond-conversao' | fzf --preview 'gh pr view {1}' --preview-window down | awk '{print $1}' | xargs gh pr checkout"


