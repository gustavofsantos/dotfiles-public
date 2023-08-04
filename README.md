# Dotfiles

Hello, this is my home directory including my personal public configuration
files.

## Note for myself

When configuring a new machine:

```
$ cd
$ git init
$ git remote add origin <this repo>
$ git pull origin main
```

### Configuring Git

I must set my user for each machine.

```sh
# ~/.gitconfig.local
[user]
    email = <email>
```

### Installing fish dependencies with fisher

#### ASDF

```sh
# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0

# install fisher plugin
fisher install rstacruz/fish-asdf
```
