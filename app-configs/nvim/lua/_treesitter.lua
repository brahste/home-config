-- Set the folding configurations
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local configs = require('nvim-treesitter.configs')
configs.setup({
  -- One of "all" or a list of languages
  ensure_installed = "all",
  indent = { enable = true, disable = { 'php' } },
  sync_install = false,  -- Install languages synchronously (only applied to `ensure_installed`)
  -- ignore_install = { "javascript" },  -- List of parsers to ignore installing
  highlight = {
    enable = true,  -- `false` will disable the whole extension
    disable = { "php", "yaml" },  -- list of languages that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

