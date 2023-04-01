local has_lsp, _ = pcall(require, 'lsp-zero')
if has_lsp then
  local lsp = require('lsp-zero')
  lsp.preset("recommended")

  lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'jsonls',
    'yamlls',
    'marksman',
    'eslint',
    'dockerls',
    'tailwindcss',
  })

  -- Fix Undefined global 'vim'
  lsp.configure('lua-language-server', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  })

  local cmp = require('cmp')
  local cmp_select = {behavior = cmp.SelectBehavior.Select}
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })

  cmp_mappings['<Tab>'] = nil
  cmp_mappings['<S-Tab>'] = nil

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings
  })

  lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
      error = 'E',
      warn = 'W',
      hint = 'H',
      info = 'I'
    }
  })


  lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)

    -- Diagnostic keymaps
    vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, opts)

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gI', function() vim.lsp.buf.implementation() end, opts)

    vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', '<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end, opts)
    vim.keymap.set('n', '<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, opts)

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  end)


  require("luasnip.loaders.from_vscode").lazy_load {
    paths = { "~/.config/nvim/snippets" }
  }

  lsp.setup()

  vim.diagnostic.config({
    virtual_text = true,
  })

end


local has_fidget, fidget = pcall(require, 'fidget')
if (has_fidget) then
  fidget.setup()
end
