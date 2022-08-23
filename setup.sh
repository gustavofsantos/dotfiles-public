#! /usr/bin/bash

# install nix-env
sh <(curl -L https://nixos.org/nix/install)

nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.git
nix-env -iA nixpkgs.silver-searcher
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.python38
nix-env -iA nixpkgs.nodejs-16_x
