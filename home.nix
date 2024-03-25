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
  home.stateVersion = "23.11";

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
    lunarvim
    xclip
    lazygit
    lazydocker
    starship
    awscli2
    #postman
    kubectl
    minikube
    devbox


    gnome.gnome-screenshot
    gnome.gnome-tweaks
    gnome.gnome-characters
    gnomeExtensions.gtk3-theme-switcher

    # Language servers, formatters, linters
    nil
    nixfmt

    # Languages
    python311
    python311Packages.pip
    nodejs_18
    nodePackages.pnpm
    go
    #protobuf

    # Rust development tools
    # I prefer to manage Rust with it's native toolchain, otherwise LSPs and
    # cross compilation are more cumbersome (using Nix).
    #rustup
    #rust-analyzer

    # C/C++ development tools
   # gnumake
    #cmake
    #pkg-config
    #clang_15
    #bear
   # llvmPackages_15.libcxxStdenv
   # llvmPackages_15.libcxx
   # llvmPackages_15.libcxxabi
   # gcc13
    #glibc
    #ninja
    #udev
    

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
    thefuck
    du-dust
    onefetch
    fastfetch
    starfetch
    alacritty

    # Security
    #openssl

    # Battery management
    #tlp

    # Networking & downloads
    wget
    curlWithGnuTls
    redis
    #redisinsight

    # Security
    bitwarden-cli

    # Disk usage & system monitoring
    htop
    ncdu

    # Desktop applications
    #thunderbird
    slack
    discord
    obsidian
    gimp
    remmina
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.ssh = {
    enable = true;
    includes = [ 
      "./config-bstef-gitlab"
      "./config-brahste-gitlab"
      "./config-brahste-github"
    ];
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
      nvim-web-devicons
      bufferline-nvim
      plenary-nvim
      telescope-fzf-native-nvim
     # copilot-vim
     # {
     #   plugin = copilot-lua;
     #   config = builtins.readFile ./app-configs/nvim/lua/copilot.lua;
     #   type = "lua";
     # }
      {
        plugin = nvim-cmp;
        config = builtins.readFile ./app-configs/nvim/lua/cmp.lua;
        type = "lua";
      }
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
     # {
     #   plugin = copilot-cmp;
     #   config = "require'copilot_cmp'.setup{}";
     #   type = "lua";
     # }
      {
        plugin = lspkind-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/lspkind.lua;
        type = "lua";
      }
      luasnip
      #{
      #  plugin = rust-tools-nvim;
      #  config = builtins.readFile ./app-configs/nvim/lua/rust-tools.lua;
      #  type = "lua";
      #}
      {
        plugin = rustaceanvim;
        config = builtins.readFile ./app-configs/nvim/lua/rustaceanvim.lua;
        type = "lua";
      }
      {
        plugin = lsp-inlayhints-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/lsp-inlayhints.lua;
        type = "lua";
      }
      vim-commentary
      lazygit-nvim
      barbar-nvim
      # statix # how work?
      {
        plugin = autoclose-nvim;
        config ="require'autoclose'.setup{}";
        type = "lua";
      }
      {
        plugin = mason-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/mason.lua;
        type = "lua";
      }
      {
        plugin = formatter-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/formatter.lua;
        type = "lua";
        
      }
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ./app-configs/nvim/lua/lspconfig.lua;
        type = "lua";
      }
      {
        plugin = kanagawa-nvim;
        config = builtins.readFile ./app-configs/nvim/lua/colorscheme.lua;
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
        plugin = autoclose-nvim;
        config = "require'autoclose'.setup{}";
        type = "lua";
      }
      {
        plugin = indent-blankline-nvim;
        config = "require'ibl'.setup{}";
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
      #PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig";
    };
    shellAliases = {
      vpn="nordvpn";
      cdv="cd ~/dev";
      cdh="cd ~/.config/home-manager";
      vim-tmp="vim ~/tmp/$(dateiso).txt";
      ls="lsd";
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
      SUDO_EDITOR=$(which nvim)
      # git repository greeter
      last_repository=
      check_directory_for_new_repository() {
              current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
              
              if [ "$current_repository" ] && \
                 [ "$current_repository" != "$last_repository" ]; then
                      onefetch
              fi
              last_repository=$current_repository
      }
      cd() {
              builtin cd "$@"
              check_directory_for_new_repository
      }

      # optional, greet also when opening shell directly in repository directory
      # adds time to startup
      check_directory_for_new_repository

      # Show new terminal splash screens, see also `motd`
      # starfetch -c yellow -r

      fastfetch --structure Disk:PublicIP --data-raw " " --logo-padding 0 --color yellow

      ip --color -br a | awk '{if ($0 ~ /UP/) printf " \033[33;1mLocal IP\033[0m:  %s\n", $0}'

      nordvpn settings | awk -F ":" '{half_length = index($0, ":"); if (NR == 1 || $0 ~ /Firewall:|Kill Switch|Meshnet/) printf " \033[33;1mVPN %s\033[0m:%s\t\n", substr($0, 1, half_length-1), substr($0, half_length+1)}' | tail +2

      date +%Z | awk '{printf " \033[33;1mTime Zone\033[0m: %s\n", $0}'
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
      init.defaultBranch = "main";
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
