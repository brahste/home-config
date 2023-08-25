{ config, pkgs, ssh_config_dir, project_root_dir, ... }:

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
  #nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # General development tools
    xclip
    lazygit
    lazydocker
    starship
    awscli2
    kubectl

    # Language servers, formatters, linters
    nil
    nixfmt

    # Languages
    #python310
    #python310Packages.pip
    nodejs_18

    # Rust development tools
    #rustup
    #rust-analyzer

    # C/C++ development tools
    gnumake
    cmake
    pkg-config
    #clang_15
    #gcc12

    # Terminal utilities
    jq
    ripgrep
    bat
    fd
    lsd
    fzf
    vivid
    nmap
    socat

    # Security
    openssl

    # Battery management
    #tlp

    # Networking & downloads
    wget
    curlWithGnuTls

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

  programs.ssh = {
    enable = true;
    includes = [ "./home-config" ];
  };

  programs.terminator = {
    enable = true;
    package = pkgs.terminator;
  };

  programs.vscode = {
    enable = true;
  };


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter;
        config = builtins.readFile ./app-configs/nvim/lua/treesitter.lua;
        type = "lua";
      }
      nvim-treesitter-parsers.cpp
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      copilot-vim
      nvim-web-devicons
      bufferline-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      {
        plugin = nvim-cmp;
        config = builtins.readFile ./app-configs/nvim/lua/cmp.lua;
        type = "lua";
      }
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      lspkind-nvim
      luasnip
      vim-commentary
      lazygit-nvim
      barbar-nvim
      # statix # how work?
      {
        plugin = mason-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/mason.lua;
        type = "lua";
      }
      mason-lspconfig-nvim
      {
        plugin = lsp-format-nvim;
        config = "require'lsp-format'.setup{}";
        type = "lua";
      }
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ./app-configs/nvim/lua/lspconfig.lua;
        type = "lua";
      }
      {
        plugin = nightfox-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/nightfox.lua;
        type = "lua";
      }
      {
       plugin = nvim-tree-lua;
       config = "require'nvim-tree'.setup{}";
       type = "lua";
      }
      {
        plugin = trouble-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/trouble.lua;
        type = "lua";
      }
      {
        plugin = nvim-lint;
        config = builtins.readFile ./app-configs/nvim/lua/nvim-lint.lua;
        type = "lua";
      }
      {
        plugin = telescope-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/telescope.lua;
        type = "lua";
      }
      {
        plugin = lualine-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/lualine.lua;
        type = "lua";
      }
      {
        plugin = alpha-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/alpha.lua;
        type = "lua";
      }
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./app-configs/nvim/lua/keybindings.lua}
      ${builtins.readFile ./app-configs/nvim/lua/configuration.lua}
    '';
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    sessionVariables = {
      LS_COLORS="$(vivid generate one-dark)";
      PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig";
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
      watch="watch --color";
      ip="ip --color";
    };
    shellGlobalAliases = {
      UUID = "$(uuidgen | tr -d \\n)";
    };
    dirHashes = {
      projects = "$HOME/dev/projects";
      learning = "$HOME/dev/learning";
      hm       = "$HOME/.config/home-manager";
    };
    initExtra = ''
      eval $(starship init zsh)
      PATH="$PATH:$HOME/.local/bin"
      PATH="$PATH:$HOME/.cargo/bin"
    '';
    oh-my-zsh = {
      enable = true;
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
    diff-so-fancy = {
      enable = true;
    };
    extraConfig = {
      alias = {
        g = "log --all --decorate --oneline --graph --color";
        s = "status";
        b = "branch";
        co = "checkout";
        aa = "!git add --all && git status";
      };
      core.editor = "nvim";
    };
  };

  services.syncthing = {
    enable = true;
  };

  xdg.configFile.terminator = {
   source = ./app-configs/terminator;
   recursive = true;
  };

  xdg.configFile.starship = {
    source = ./app-configs/starship/starship.toml;
    target = "./starship.toml";
  };

  home.file.".ssh" = {
    source = ./app-configs/ssh;
    recursive = true;
  };

  home.file.".local/bin" = {
    source = ./scripts;
    recursive = true;
  };
}
