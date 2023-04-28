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
    # Development tools
    git
    xclip
    lazygit
    vscode

    # Language servers
    rnix-lsp

    # Terminal
    zsh
    ripgrep
    bat
    fd
    lsd
    fzf
    #autojump
    vivid

    # Networking & downloads
    wget
    curl

    # Languages & lang-tools
    python39

    # Disk usage & system monitoring
    htop
    ncdu

    # Desktop applications
    slack
    obsidian
  ];

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
    shellAliases = 
    {
      vpn="nordvpn";
      cdv="cd ~/dev";
      cdh="cd ~/.config/home-manager";
      ls="lsd";
      ll="lsd -l";
      la="lsd -la";
      lt="lsd --tree";
      lta="lsd --tree --all";
    };
    shellGlobalAliases =
      {
        UUID = "$(uuidgen | tr -d \\n)";
      };
    oh-my-zsh = {
      enable = true;
      #theme = "simple";
      #theme = "nanotech";
      #theme = "mh";
      theme = "gallois";
      plugins = ["fzf"];
    };
    envExtra = "[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh\nautoload -U compinit && compinit -u";
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.0";
          sha256 = "eRTk0o35QbPB9kOIV0iDwd0j5P/yewFFISVS/iEfP2g=";
        };
      }
        #{
        #name = "enhancd";
        #file = "init.sh";
        #src = pkgs.fetchFromGitHub {
        #  owner = "b4b4r07";
        #  repo = "enhancd";
        #  rev = "v2.5.1";
        #  sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
        #};
      #{
      #  name = "autojump";
      #  file = "install.py";
      #  src = pkgs.fetchFromGitHub {
      #    owner = "wting";
      #    repo = "autojump";
      #    rev = "release-v22.5.3";
      #    sha256 = "mrPMgwVkqOlKjvy1106MUKF7OlEtKdt8E9mqCg7U9+U=";
      #  };
      #}
    ];
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
