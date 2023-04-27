local opts = {
    tools = {
        -- autoSetHints = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
        --     show_parameter_hints = false,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "-> ",
        },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
         --temporary, delete below line in future: see https://github.com/simrat39/rust-tools.nvim/issues/300
        inlayHints = { locationLinks = false },
        checkOnSave = { command = "clippy" },
      }
    },
  },
}

require('rust-tools').setup(opts)

vim.g['rustfmt_autosave'] = 1
