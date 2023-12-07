-- Language servers are managed via :Mason install candidates

local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- NOTE: the rust-analyzer server is set up in _rust-tools.lua, not here

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
-- nvim_lsp.jsonls.setup{on_attach=require('lsp-format').on_attach, capabilities=capabilities}

-- Enable Nix lsp
nvim_lsp.nil_ls.setup{on_attach=on_attach, capabilities=capabilities}

-- Enable docker-language-server
nvim_lsp.dockerls.setup{on_attach=on_attach, capabilities=capabilities}
nvim_lsp.docker_compose_language_service.setup{on_attach=on_attach, capabilities=capabilities}


-- Enable Python language server
-- Note: To use pyright you need to set the path to python3 via something like
-- `:PyrightSetPythonPath $(which python3)` or use a virtualenv
nvim_lsp.pyright.setup{on_attach=on_attach, capabilities=capabilities} 

-- Note: If you're having trouble getting ansible lang-server to attach,
-- try issuing ':set ft=yaml.ansible'
nvim_lsp.ansiblels.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes = {"yaml.ansible"}
})

-- Enable yaml-language-server, see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
nvim_lsp.yamlls.setup{on_attach=on_attach, capabilities=capabilities}

-- Protocol Buffers language server
nvim_lsp.bufls.setup{on_attach=on_attach, capabilities=capabilities}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostics configurations
vim.diagnostic.config({
  virtual_text = false,
  float = { border = "rounded" }
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250

-- Uncomment below for pop-up diagnostics
-- Beware, this often gets in the way of the LSP display
-- See keybindings.lua -> use Ctrl+L to view diagnostics
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
