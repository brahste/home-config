local lspkind = require'lspkind'
local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i" }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },

  sources = {
    { name = 'luasnip', group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'path', group_index = 2 },
    { name = 'buffer', group_index = 3 },
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      mode = 'symbol',
      maxwidth = 80,
      ellipsis_char = '…',
      menu = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        path = "[path]",
        buffer = "[buf]",
      }
    }
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  experimental = {
    native_menu = false,
    ghost_text = true
  },
})
