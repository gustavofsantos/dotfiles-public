local lspconfig = require('lspconfig')
if (not lspconfig) then return end

local protocol = require('vim.lsp.protocol')
local keymap = vim.keymap.set
local saga_status, saga = pcall(require, 'lspsaga')

if (saga_status) then
  saga.init_lsp_saga({
    code_action_lightbulb = {
      enable = false,
      enable_in_insert = false,
      cache_code_action = true,
      sign = true,
      update_time = 150,
      sign_priority = 20,
      virtual_text = true,
    }
  })

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
  -- Code action
  keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  -- Rename
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
  -- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
  -- Show line diagnostics
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
  -- Show cursor diagnostics
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
  -- Diagnostic jump can use `<c-o>` to jump back
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  -- Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  -- Outline
  keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
  -- Hover Doc
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
end

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
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

-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 300,
}

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  on_attach = on_attach,
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
  'svelte'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }
end
