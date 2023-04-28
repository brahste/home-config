# home-config

This repository is continually changing to suit the needs of my base development setup.

## Getting Started

### Dependencies
- Nix - download and installation instructions can be found [here](https://nixos.org/download.html).
- Home Manager - this will be installed and initialized during in the Setup section below.


```bash
# Clone this repo to '~/.config/home-manager'
git clone git@github.com:brahste/home-config.git ~/.config/home-manager

# Enable nix flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" | tee ~/.config/nix/nix.conf

# Install home-manager
nix run ~/.config/home-manager#homeConfigurations.braden.activationPackage
```
