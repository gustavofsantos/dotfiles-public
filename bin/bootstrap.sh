#!/bin/sh

echo ">> Installing dependencies"
sudo apt install -y automake lzma pcre2-utils

# Install asdf
echo ">> Installing ASDF"

# Install asdf plugins
echo ">> Installing ASDF plugins"
asdf plugin add neovim
asdf plugin add nodejs
asdf plugin add exa
asdf plugin add fzf
asdf plugin add golang
asdf plugin-add jq https://github.com/AZMCode/asdf-jq.git
