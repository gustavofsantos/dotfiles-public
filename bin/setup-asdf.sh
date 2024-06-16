#!/usr/bin/sh

if [ -e  "$HOME/.asdf/asdf.sh" ]; then
  echo "==== Installing ASDF ===="
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  . "$HOME/.asdf/asdf.sh"
fi

echo "==== Configuring plugins ===="
# languages
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf plugin-add luaJIT https://github.com/smashedtoatoms/asdf-luaJIT.git
asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
asdf plugin-add python

# tools
asdf plugin-add neovim
asdf plugin add eza https://github.com/lwiechec/asdf-eza.git
asdf plugin add fd
asdf plugin add ag
asdf plugin-add direnv
asdf plugin add ripgrep
asdf direnv setup --shell zsh --version latest
asdf plugin add delta https://github.com/andweeb/asdf-delta.git
asdf plugin add clj-kondo https://github.com/rynkowsg/asdf-clj-kondo.git
asdf plugin add bat
asdf plugin add bat-extras
asdf plugin add babashka https://github.com/pitch-io/asdf-babashka.git
asdf plugin add awscli
asdf plugin add fzf https://github.com/kompiro/asdf-fzf.git
asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf plugin add git-cliff
asdf plugin add gum https://github.com/lwiechec/asdf-gum.git
asdf plugin add hyperfine
asdf plugin-add jq https://github.com/lsanwick/asdf-jq.git
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf plugin add lazygit
asdf plugin-add lein https://github.com/miorimmax/asdf-lein.git
asdf plugin-add maven
asdf plugin-add postgres
asdf plugin-add sqlite
asdf plugin-add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add zellij https://github.com/chessmango/asdf-zellij.git
asdf plugin add zoxide https://github.com/nyrst/asdf-zoxide.git
asdf plugin-add gomigrate https://github.com/joschi/asdf-gomigrate

echo "==== Installing tools ===="
asdf install
