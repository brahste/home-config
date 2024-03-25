vim.opt.termguicolors = true

-- local palettes = {
--   nightfox = {
--     cyan = { base = "#75bd93", bright = "#75bd93", dim = "#75bd93" },
--     -- yellow = { base = "#f1bf4b", bright = "#f1bf4b", dim = "#f1bf4b" },
--     -- -- red = { base = "#d96840", bright = "#d96840", dim = "#d96840" },
--     -- red = { base = "#f99b48", bright = "#f99b48", dim = "#f99b48" },
--     -- -- pink = { base = "#d96840", bright = "#d96840", dim = "#d96840" },
--     pink = { base = "#f99b48", bright = "#f99b48", dim = "#f99b48" },
--     orange = { base = "#f99b48", bright = "#f99b48", dim = "#f99b48" },
--     -- orange = { base = "#f99b48", bright = "#f99b48", dim = "#f99b48" },
--   }
-- }

-- require('nightfox').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = true,    -- Disable setting background
--     terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,   -- Non focused panes set to alternative background
--     styles = {              -- Style to be applied to different syntax groups
--       comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
--       conditionals = "bold",
--       constants = "NONE",
--       functions = "bold,italic",
--       keywords = "italic,bold",
--       numbers = "NONE",
--       operators = "bold",
--       strings = "italic",
--       types = "NONE",
--       variables = "NONE",
--     },
--     inverse = {             -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     modules = {             -- List of various plugins and additional options
--       -- ...
--     },
--   },
--   palettes = palettes
-- })

require('kanagawa').setup({
  overrides = function(colors)
    local theme = colors.theme
    return {
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
    }
  end,
  overrides = function(colors)
      local theme = colors.theme
      return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      }
  end,
  colors = {
    theme = {
        all = {
            ui = {
                bg_gutter = "none"
            }
        }
    }
  }
})

-- vim.cmd([[colorscheme nightfox]])
vim.cmd([[colorscheme kanagawa]])
vim.cmd([[hi Normal guibg=none]])

