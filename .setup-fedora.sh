#!/bin/sh

echo Install basic packages for fedora

# Shell and terminal stuff
echo Installing starship if not installed...
if ! command -v starship &> /dev/null
then
    echo "\tInstalling starship..."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "\tStarship is already installed"
fi

# Update the system
sudo dnf update

# Basic programming languages
sudo dnf install golang
mkdir -p $HOME/go


sudo dnf install 'dnf-command(config-manager)'
# Configuring github cli repo
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
# Configuring kubernetes repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo dnf copr enable atim/lazygit -y


# Install utilitary packages
sudo dnf install -y \
  git \
  curl \
  wget \
  btop \
  ripgrep \
  git-delta \
  zsh \
  fish \
  gh \
  fd-find \
  kubectl \
  hyperfine \
  httpie \
  poetry \
  pipx \
  python3-flake8 \
  python3-autopep8 \
  python3-isort \
  black \
  tealdeer \
  zoxide \
  lazygit \
  eza \
  fzf \
  tmux \
  yq \
  jq \
  bat \
  neovim

curl https://sh.rustup.rs -sSf | sh
cargo install sheldon
cargo install --locked zellij

go install github.com/joshmedeski/sesh@latest
go install github.com/charmbracelet/gum@latest
go install github.com/jesseduffield/lazydocker@latest
go install github.com/arl/gitmux@latest

pipx install poethepoet
