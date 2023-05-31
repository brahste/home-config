require('packages')

require('_nvim-lspconfig')
require('_nvim-lint')
require('_mason')
require('_formatter')
require('_cmp')

require('_rust-tools')
require('_dap-adapter')

require('_treesitter')
require('_trouble')
require('_telescope')
require('_nvim-tree')

require('_barbar')
require('_lualine')
require('_nvim-autopairs')
require('_alpha-nvim')

require('configuration')
require('colorscheme')
require('keybindings')

require('nvim-ts-autotag').setup()

require("nvim-surround").setup({
    -- Configuration here, or leave empty to use defaults
})
