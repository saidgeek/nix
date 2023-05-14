# NixOS Configs

## nixos rebuild command to flake

```shell
sudo nixos-rebuild switch --flake <flake-path>
```

## install home-manager

```shell
nix run ~/develop/nixos-configs#homeConfigurations.<username>.activationPackag
```

## run home-manager before install

```shell
home-manager switch --flake <flake-path>#<username>
```
