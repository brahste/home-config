vim.opt.termguicolors = true

local palettes = {
  nightfox = {
    cyan = { base = "#4f9c71", bright = "#4f9c71", dim = "#4f9c71" },
  }
}

require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "bold",
      constants = "NONE",
      functions = "bold",
      keywords = "italic,bold",
      numbers = "NONE",
      operators = "bold",
      strings = "italic",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = palettes
})

vim.cmd([[colorscheme nightfox]])
vim.cmd([[hi Normal guibg=none]])

