. "$HOME/.cargo/env"

if [ -e /home/gustavo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gustavo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Loggi aliases
alias lggt="npm run test -- --bail --coverage=false --watchAll=false"
alias lw_diff="git diff -U0 master...HEAD '*.py'"
alias lw_format="lw_diff | ~/loggi/web/ops/black.sh fix"
alias lw_lint="lw_diff | flake8 --config=loggi/.flake8 --diff && ~/loggi/web/ops/black.sh check"
alias lw_auth="sh ~/dotfiles/bash_scripts/lw_auth.sh"
# Run tests
# Example: lwt tests/bla/bla
alias lwt="docker-compose exec -e DJANGO_SETTINGS_MODULE=settings.test loggi_web_app pytest -vv"
# Apply migrations
alias lw_migrate="docker-compose exec loggi_web_app bash -c './manage.py migrate'"
alias lw_test_urls="docker-compose exec loggi_web_app bash -c 'python manage.py validate_urls && printf \"\n✅ All right with unitary tests for URLs\n\n\" && exit 0 || printf \"\n⚠️  Problem with tests for URLs.\nPlease check the messages above to fix the problem with the tests.\nGood reading: https://loggidev.atlassian.net/wiki/spaces/SI/pages/1351418174/Testing+URI+on+Loggi-web\n\n\" && exit 1'"
alias lw_show_urls="docker-compose exec loggi_web_app bash -c 'python manage.py show_urls'"
