# dotfiles

## Setup

### NixOS

```bash
sudo nixos-rebuild switch --flake .#thinkpad-e14-gen-6
nix run github:nix-community/home-manager/release-26.05 -- switch --flake .#thinkpad-e14-gen-6
```

### Non-NixOS

```bash
chmod +x setup-nix-on-non-nixos.sh
./setup-nix-on-non-nixos.sh
nix run github:nix-community/home-manager/release-26.05 -- switch --flake .#eq12
```

#### Ubuntu

In addition, apply AppArmor profiles.

```bash
sudo ln -s $(realpath nix-apparmor) /etc/apparmor.d/
sudo apparmor_parser -r /etc/apparmor.d/nix-apparmor
```
