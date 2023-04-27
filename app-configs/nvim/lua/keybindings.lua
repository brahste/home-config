local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
  keymap('n', key, map, opts)
end

-- Clipboard keybindings
keymap('v', '<C-c>', '"+y', {})

-- File-level keybindings - Save file
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Window adjustment keybindings
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- LSP Keybindings
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- Telescope keybindings
nkeymap('<leader>ff', ':Telescope find_files<cr>')
nkeymap('<leader>fg', ':Telescope live_grep<cr>')
nkeymap('<leader>fb', ':Telescope buffers<cr>')
nkeymap('<leader>fh', ':Telescope help_tags<cr>')

-- Barbar keybindings for moving tabs
-- Move to previous/next
keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
keymap('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>', opts)
-- Magic buffer-picking mode
keymap('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<leader>obn', ':BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<leader>obd', ':BufferOrderByDirectory<CR>', opts)
keymap('n', '<leader>obl', ':BufferOrderByLanguage<CR>', opts)

-- Nvim Tree commands
keymap('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)

-- lspconfig
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', 'L', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', opts)

-- Debug Adapter commands
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>bb', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>dt', function() require('dap').terminate() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.frames).open()
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.scopes).open()
end)
