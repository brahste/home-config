-- All language servers installed at ~/.local/share/nvim/lsp_servers/
-- and symlinked to ~/.local/bin/

local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
-- Note: the rust-analyzer server is set up in _rust-tools.lua, not here

-- Enable clangd
nvim_lsp.clangd.setup{on_attach=on_attach, capabilities=capabilities}

-- Enable cmake-language-server
nvim_lsp.cmake.setup{on_attach=on_attach, capabilities=capabilities}

-- Enable bash-language-server
nvim_lsp.bashls.setup{on_attach=on_attach, capabilities=capabilities}

-- Enable JS/TS, HTML, and CSS language servers
nvim_lsp.tsserver.setup{on_attach=on_attach, capabilities=capabilities}
nvim_lsp.html.setup{on_attach=on_attach, capabilities=capabilities}
nvim_lsp.cssls.setup{on_attach=on_attach, capabilities=capabilities}

-- Enable docker-language-server
-- require'lspconfig'.dockerls.setup{capabilities=capabilities}

-- Enable Python language server
-- Note: To use pyright you need to set the path to python3 via something like
-- `:PyrightSetPythonPath $(which python3)`
nvim_lsp.pyright.setup{on_attach=on_attach, capabilities=capabilities}

-- Note: To use pylsp you will need something like pyrightconfig.json in your project root
-- nvim_lsp.pylsp.setup{on_attach=on_attach, capabilities=capabilities}

-- Note: If you're having trouble getting ansible lang-server to attach,
-- try issuing ':set ft=yaml.ansible'
nvim_lsp.ansiblels.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes = {"yaml.ansible"}
})

-- Protocol Buffers language server
nvim_lsp.bufls.setup{on_attach=on_attach, capabilities=capabilities}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Diagnostics configurations
vim.diagnostic.config({
  virtual_text = false
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250

-- Uncomment below for pop-up diagnostics
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
