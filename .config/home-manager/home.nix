{ config, pkgs, ... }:

let

  pkgsUnstable = import <nixpkgs-unstable> {};

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gustavo-santos";
  home.homeDirectory = "/home/gustavo-santos";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # programming languages and environments
    pkgs.nodejs_22
    pkgs.ruby
    pkgs.python311
    pkgs.elixir
    pkgs.go
    pkgs.erlang
    pkgs.zulu17
    pkgs.clojure

    # tools
    pkgs.btop
    pkgs.ripgrep
    pkgs.delta
    pkgs.starship
    pkgs.sheldon
    pkgs.grc
    pkgs.powershell
    pkgs.elixir-ls
    pkgs.gh
    pkgs.fd
    pkgs.kubectl
    pkgsUnstable.sesh
    pkgsUnstable.gum
    pkgs.hyperfine
    pkgs.httpie
    pkgs.pyenv
    pkgs.poetry
    pkgs.poethepoet
    pkgs.python311Packages.pip
    pkgs.python311Packages.flake8
    pkgs.python311Packages.pep8
    pkgs.python311Packages.debugpy
    pkgs.black
    pkgs.isort
    pkgsUnstable.zellij
    pkgs.tealdeer
    pkgs.zoxide
    pkgs.lazygit
    pkgs.lazydocker
    pkgsUnstable.neovim
    pkgs.helix
    pkgs.eza
    pkgs.bat
    pkgs.yq
    pkgs.fzf
    pkgs.yarn
    pkgs.tmux
    pkgs.gitmux
    pkgs.difftastic
    pkgs.entr
    pkgs.clojure-lsp
    pkgs.leiningen
    pkgs.clj-kondo
    pkgs.babashka
    pkgs.cabal-install
    pkgs.sq
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gustavo/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
