{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "braden";
  home.homeDirectory = "/home/braden";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  targets.genericLinux.enable = true;

  # Allow unfree packages. As of May 2023, there is 
  # a bug with the standard 'nixpkgs.config.allowUnfree = true' 
  # with stand alone home-manager, the following line works.
  # Ref: https://discourse.nixos.org/t/home-manager-standalone-module-or-flake/23920/3
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # General development tools
    xclip
    lazygit
    lazydocker
    starship
    pre-commit # -- remove
    redis      # -- remove
    awscli2

    # Language servers, formatters, linters
    nil
    nixfmt

    # Languages
    #python310
    #python310Packages.pip
    nodejs_18

    # Rust development tools
    rustup

    # C/C++ development tools
    gnumake
    cmake
    # LLVM Clang toolset includes: clang, clang++, clang-format, clangd
    #llvmPackages_15.libclang 
    gcc12

    # Terminal utilities
    jq
    ripgrep
    bat
    fd
    lsd
    fzf
    vivid

    # Networking & downloads
    wget
    curl

    # Security
    bitwarden-cli

    # Disk usage & system monitoring
    htop
    ncdu

    # Desktop applications
    thunderbird
    slack
    obsidian
    signal-desktop
    gimp
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.terminator = {
    enable = true;
    package = pkgs.terminator;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.vscode = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    sessionVariables = {
      LS_COLORS="$(vivid generate one-dark)";
    };
    shellAliases = {
      dateutc_long="date --utc +%Y-%m-%dT%H-%M-%SZ";
      dateutc_short="date --utc +%y%m%dT%H%M%SZ";
      vpn="nordvpn";
      cdv="cd ~/dev";
      cdh="cd ~/.config/home-manager";
      ls="lsd";
      ll="lsd -l";
      la="lsd -la";
      lt="lsd --tree";
      lta="lsd --tree --all";
    };
    shellGlobalAliases = {
      UUID = "$(uuidgen | tr -d \\n)";
    };
    dirHashes = {
      projects = "$HOME/dev/projects";
      learning = "$HOME/dev/learning";
      hm       = "$HOME/.config/home-manager";
    };
    initExtra = "eval $(starship init zsh)";
    oh-my-zsh = {
      enable = true;
      #theme = "nanotech";
      #theme = "gallois";
      #theme = "bureau";
      #theme = "powerlevel10k";
      #theme = "brahste-bureau";
      #theme = "brahste-gallois";
      plugins = ["fzf"];
      custom = "$HOME/.config/home-manager/app-configs/zsh-custom";
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.0";
          sha256 = "eRTk0o35QbPB9kOIV0iDwd0j5P/yewFFISVS/iEfP2g=";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    extraConfig = {
      alias = {
        g = "log --all --decorate --oneline --graph --color";
        s = "status";
        b = "branch";
        co = "checkout";
      };
      core.editor = "nvim";
    };
  };

  services.syncthing = {
    enable = true;
  };

  # Manually managed configuration files, home-manager will
  # place these files/directories in ~/.config/ 
  xdg.configFile.nvim = {
    source = ./app-configs/nvim;
    recursive = true;
  };

  xdg.configFile.terminator = {
   source = ./app-configs/terminator;
   recursive = true;
  };

  xdg.configFile.vscode = {
   source = ./app-configs/vscode;
   target = "./Code/User";
  recursive = true;
  };
}
