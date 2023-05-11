-- Set the folding configurations
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local configs = require('nvim-treesitter.configs')
configs.setup({
  -- One of "all" or a list of languages
  ensure_installed = {"typescript", "python", "rust", "cpp", "html", "css", "javascript", "nix", "yaml", "toml", "tsx", "lua", "markdown", "markdown_inline"},
  indent = { enable = true },
  sync_install = true,  -- Install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "php" },  -- List of parsers to ignore installing
  -- autotag = {
  --   enable = true,
  -- }
  highlight = {
    enable = true,  -- `false` will disable the whole extension
    disable = { "php" },  -- list of languages that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

