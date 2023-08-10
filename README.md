# home-config

A reproducible development configuration.

## Getting Started

### Dependencies
- Git and Curl
- Nix - download and installation instructions can be found [here](https://nixos.org/download.html).

### Setup
```bash
# Replace apt with your OS's package manager
sudo apt install git curl

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
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
fc-cache
```
2. Change your default shell to zsh.
```bash
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

### Optional Steps
- Install visual studio code extensions managed in **app-config/vscode/extensions.json**.
```bash
hm$ ./scripts/install-vscode-extensions.sh
```
