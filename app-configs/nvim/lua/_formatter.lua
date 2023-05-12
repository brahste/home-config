local util = require "formatter.util"
require('formatter').setup({
  filetype = {
    cpp = {
       function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    },
    cmake = {
      -- Installed via :Mason -> cmakelang
       function()
          return {
            exe = "cmake-format",
            args = { "-" },
            stdin = true,
          }
        end
    },
    typescript = {
      function()
          return {
            exe = "prettierd",
            args = { util.escape_path(util.get_current_buffer_file_path()) },
            stdin = true,
          }
      end
    },
    typescriptreact = {
      function()
          return {
            exe = "prettierd",
            args = { util.escape_path(util.get_current_buffer_file_path()) },
            stdin = true,
          }
      end
    }
  },
  ["*"] = {
    -- "formatter.filetypes.any" defines default configurations for any
    -- filetype
    require("formatter.filetypes.any").remove_trailing_whitespace
  }
})

-- Format on save
vim.cmd [[augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END]]
