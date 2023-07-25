# home-config

Commission development machines with ease.

## Getting Started

### Dependencies
- Git and Curl
- Nix - download and installation instructions can be found [here](https://nixos.org/download.html).
- Home Manager - this will be installed and initialized during in the Setup section below.

### Setup
```bash
# Enable nix flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" | tee ~/.config/nix/nix.conf

# Clone this repo to '~/.config/home-manager'
git clone git@github.com:brahste/home-config.git ~/.config/home-manager

# Install home-manager
nix run ~/.config/home-manager#homeConfigurations.braden.activationPackage
```

### Additional Steps
Some additional steps are required.
1. Install the [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) and install it
```bash
unzip Hack.zip -d ~/.local/share/fonts
fc-cache
```
2. Change your default shell to zsh. First, add the output of `$(which zsh)` to `/etc/shells`. Then run `chsh -s $(which zsh)`.


### Optional Steps
- Install visual studio code extensions managed in **app-config/vscode/extensions.json**.
  ```bash
  hm$ ./scripts/install-vscode-extensions.sh
  ```
