vim.diagnostic.config({
  virtual_text = true,
})

local has_neodev, neodev = pcall(require, "neodev")
if not has_neodev then
  return
end
neodev.setup({
  library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
})

local has_lsp, lsp = pcall(require, "lsp-zero")
if not has_lsp then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "lua_ls",
  "tsserver",
  "jsonls",
})

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "gr", function()
    require("telescope.builtin").lsp_references()
  end, opts)
  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("n", "<leader>fs", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("i", "gs", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

lsp.setup()

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)       -- For `luasnip` users.
    end,
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
  },
})

require("lint").linters_by_ft = {
  markdown = { "vale" },
  python = { "ruff" },
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
