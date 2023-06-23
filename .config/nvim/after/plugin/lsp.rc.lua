vim.diagnostic.config({
  virtual_text = true,
})

local has_fidget, fidget = pcall(require, 'fidget')
if (has_fidget) then
  fidget.setup()
end

local has_mason, _ = pcall(require, 'mason')
if (has_mason) then
  require('mason').setup({ })
end

local has_lsp, _ = pcall(require, 'lsp-zero')
if (has_lsp) then
  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps(client, bufnr)

    vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')

    -- hover documentation
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    vim.keymap.set('n', '<leader>K', '<cmd>Lspsaga hover_doc ++keep<CR>')

    -- toggle outline
    vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')

    -- rename
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>')
    vim.keymap.set('n', '<leader>Rn', '<cmd>Lspsaga rename ++project<CR>')

    -- code actions
    vim.keymap.set({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
    vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
    vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

    vim.keymap.set({'n', 'x'}, 'gq', function()
      vim.lsp.buf.format({
        async = false,
        timeout_ms = 1000,
      })
    end)
  end)

  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.set_server_config({
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
      }
    }
  })

  lsp.setup()
end

local has_cmp, _ = pcall(require, 'cmp')
if (has_cmp) then
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "~/.config/nvim/snippets" }
  })

  cmp.setup({
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    mapping = {
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      ['<C-Space>'] = cmp.mapping.complete(),
    },
    formatting = {
      fields = {'abbr', 'kind', 'menu'},
      format = require('lspkind').cmp_format({
        -- mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      })
    }
  })
end

local has_lspsaga, _ = pcall(require, 'lspsaga')
if has_lspsaga then
  require('lspsaga').setup({
    ui = {
      title = true
    },
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
    }
  })
end
