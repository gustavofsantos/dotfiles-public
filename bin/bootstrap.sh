#!/bin/zsh

echo ">> Installing dependencies"
sudo apt install -y automake lzma pcre2-utils

# Install asdf
echo ">> Installing ASDF"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

# Install asdf plugins
echo ">> Installing ASDF plugins"
asdf plugin add neovim
asdf plugin add nodejs
asdf plugin add exa
asdf plugin add fzf
asdf plugin add golang
asdf plugin add zoxide
asdf plugin add ripgrep
asdf plugin-add jq https://github.com/AZMCode/asdf-jq.git
asdf plugin-add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
