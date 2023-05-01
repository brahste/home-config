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
  home.stateVersion = "22.11";

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
    git
    xclip
    lazygit
    vscode

    # Languages
    python39

    # Language servers
    rnix-lsp
    cmake-language-server

    # C++ development tools
    # LLVM Clang toolset, includes: clang, clang++, clang-format, clang
    llvmPackages_9.libclang
    cmake

    # Terminal
    ripgrep
    bat
    fd
    lsd
    fzf
    vivid

    # Networking & downloads
    wget
    curl

    # Disk usage & system monitoring
    htop
    ncdu

    # Desktop applications
    slack
    obsidian
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  # optional for nix flakes support in home-manager 21.11, but
  # not required in home-manager unstable or 22.05
  #programs.direnv.nix-direnv.enableFlakes = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    sessionVariables = {
      LS_COLORS="$(vivid generate one-dark)";
    };
    shellAliases = {
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
    oh-my-zsh = {
      enable = true;
      #theme = "nanotech";
      #theme = "gallois";
      #theme = "bureau";
      #theme = "powerlevel10k";
      #theme = "brahste-bureau";
      theme = "brahste-gallois";
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
}
