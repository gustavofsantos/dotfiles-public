vim.diagnostic.config({
  virtual_text = true,
})

local has_luasnip, _ = pcall(require, 'luasnip')
if has_luasnip then
  require("luasnip.loaders.from_vscode").lazy_load {
    paths = { "~/.config/nvim/snippets" }
  }
end

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
  end)

  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()
end

local has_cmp, cmp = pcall(require, 'cmp')
if (has_cmp) then
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

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
    }
  })

end
