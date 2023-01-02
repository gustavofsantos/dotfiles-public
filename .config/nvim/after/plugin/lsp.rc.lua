local has_mason, mason = pcall(require, 'mason')
if (has_mason) then
  mason.setup {}
end

local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if (has_mason_lspconfig) then
  mason_lspconfig.setup({
    ensure_installed = {
      "bashls",
      "sumneko_lua",
      "rust_analyzer",
      "eslint",
      "gopls",
      "denols",
      "tsserver",
      "marksman",
      "pyright",
      "tailwindcss",
      "yamlls"
    }
  })
end

local has_fidget, fidget = pcall(require, 'fidget')
if (has_fidget) then
  fidget.setup()
end


local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Diagnostic keymaps
  nmap('[e', vim.diagnostic.goto_prev)
  nmap(']e', vim.diagnostic.goto_next)
  nmap('<leader>e', vim.diagnostic.open_float)
  nmap('<leader>q', vim.diagnostic.setloclist)

  nmap('gd', vim.lsp.buf.definition, '[G]o to [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]o to [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]o to [I]mplementation')

  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 300,
}

local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
local has_cmp_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if (has_lspconfig and has_cmp_lsp) then
  local protocol = require('vim.lsp.protocol')
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }

  local capabilities = cmp_lsp.default_capabilities()

  lspconfig.denols.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  }

  lspconfig.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    flags = lsp_flags,
    capabilities = capabilities
  }

  lspconfig.elixirls.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh" }
  }

  lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
  }

  local servers = {
    'pyright',
    'dockerls',
    'html',
    'jsonls',
    'eslint',
    'yamlls',
    'gopls',
    'dotls',
    'prismals',
    'purescriptls',
    'tailwindcss',
    'svelte',
    'marksman'
  }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities
    }
  end
end
