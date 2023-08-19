local has_projectconfig, _ = pcall(require, 'nvim-projectconfig')
if not has_projectconfig then return end

require('nvim-projectconfig').setup({
  project_config = {
    {
      path = ".+/targets/beyond", -- Loggi's Beyond UI project
      config = "~/.config/nvim/projects/beyond-ui.vim"
    },
    {
      path = ".+/apps/beyond",
      config = "~/.config/nvim/projects/beyond-py.vim"
    }
  }
})
