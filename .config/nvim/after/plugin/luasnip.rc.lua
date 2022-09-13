local status, vscode_loader = pcall(require, 'luasnip.loaders.from_vscode')
if (not status) then return end

vscode_loader.lazy_load { paths = { "./dotfiles-public/.config/nvim/snippets" } }
