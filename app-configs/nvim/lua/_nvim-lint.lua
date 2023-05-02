require('lint').linters_by_ft = {
  typescriptreact = {'eslint_d',},
  typescript = {'eslint_d',}
}

-- Lint on save
vim.cmd [[au BufWritePost * lua require('lint').try_lint()]]
