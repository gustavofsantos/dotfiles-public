# Dotfiles

Hello, this is my home directory including my personal public configuration files.

## Note for myself

When configuring a new machine:

```
$ cd
$ git init
$ git remote add origin <this repo>
$ git pull origin main
```

## Nix and Home manager

How to install `nix-env`:

```sh
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

Then install `home-manager`:

```sh
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
```

Now I can use `home-manager` to install my configuration:

```sh
$ hm switch
```

PS: `hm` is an alias to `home-manager` cli.

### Configuring Git

I must set my user for each machine.

```sh
# ~/.gitconfig.local
[user]
    email = <email>
```
