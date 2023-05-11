local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function()

  -- Packer core: Lua package management tool
  use 'wbthomason/packer.nvim'

  -- Themes + appearance
  use 'EdenEast/nightfox.nvim'
  use 'hoob3rt/lualine.nvim'       -- Statusline plugin
  use {
    'romgrk/barbar.nvim',          -- Buffer tab-styling at top of editor
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'goolord/alpha-nvim',          -- Cool landing page
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Generic utilities
  use 'vimwiki/vimwiki'            -- Add more about the VIM Wiki!
  use 'tpope/vim-commentary'       -- Simple block commenting with `gcc` and `gc`
  use 'windwp/nvim-autopairs'      -- Dynamic braces matching and spacing
  use {
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }
  use 'mhinz/vim-signify'          -- Annotates added, removed, and modified lines
  use 'mhartington/formatter.nvim' -- For generic code formatting with :Format
  use {
      'williamboman/mason.nvim',   -- For managing language servers, formatters, etc.
      run = ':MasonUpdate' -- :MasonUpdate updates registry contents
  }
  use 'kdheepak/lazygit.nvim'      -- Lazygit integration, need lazygit program installed

  -- IDE plugins and editor experience
  use 'mfussenegger/nvim-dap'            -- Debugger
  use 'mfussenegger/nvim-lint'           -- Lint capabilities
  use {
    'nvim-treesitter/nvim-treesitter',   -- Adds syntax highlight and analysis
    run = function() require("nvim-treesitter.install").update { with_sync = true } end
    -- run = ':TSUpdate',
  }
  use 'windwp/nvim-ts-autotag'
  use {
    'kyazdani42/nvim-tree.lua',          -- Tree view, accessible with <F2>
    requires = {
      'kyazdani42/nvim-web-devicons',    -- optional, for file icons
    },
  }
  use { 
    'L3MON4D3/LuaSnip',                  -- Snippet support
    requires = {'honza/vim-snippets'} 
  }
  use {
    'neovim/nvim-lspconfig',             -- Native neovim LSP support
  }
  use {
    'hrsh7th/nvim-cmp',                  -- Variety of completion plugins
    'hrsh7th/cmp-nvim-lsp',              
    'hrsh7th/cmp-nvim-lua',                  
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  }

  use { 
    'nvim-telescope/telescope.nvim',    -- For project-wide file and grep finders, use <leader>ff
    requires = 
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-lua/plenary.nvim' }
  }
  use {
    "folke/trouble.nvim",                -- LSP diagnostics in separate buffer, use :Trouble
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Tools for Rust
  use {
    'simrat39/rust-tools.nvim',
    'rust-lang/rust.vim',
  }

end) -- Packer end

