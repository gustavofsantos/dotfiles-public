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
