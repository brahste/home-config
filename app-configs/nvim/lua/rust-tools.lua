--local opts = {
--    tools = {
--        -- autoSetHints = true,
--        runnables = {
--            use_telescope = true
--        },
--        inlay_hints = {
--            show_parameter_hints = true,
--            parameter_hints_prefix = "<- ",
--            other_hints_prefix = "=> ",
--        },
--    },
--    server = {
--      settings = {
--        ["rust-analyzer"] = {
--         --temporary, delete below line in future: see https://github.com/simrat39/rust-tools.nvim/issues/300
--        inlayHints = { locationLinks = false },
--        checkOnSave = { command = "clippy" },
--      }
--    },
--  },
--}

--require('rust-tools').setup(opts)

local rt = require("rust-tools")

rt.setup({
  inlay_hints = {
    show_parameter_hints = true,
    parameter_hints_prefix = "+ ",
    other_hints_prefix = "~ ",
  },
  server = {
    -- on_attach=require('lsp-format').on_attach,
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = { 
          command = "clippy"
        },
        diagnostics = {
          enable = false;
        }
      }
    },
  },
})

vim.g['rustfmt_autosave'] = 1
