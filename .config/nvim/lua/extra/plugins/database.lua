return {
  "tpope/vim-dadbod",
  dependencies = {
    { "kristijanhusak/vim-dadbod-ui",         lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    "hrsh7th/nvim-cmp"
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = '~/.scripts/work/loggi/redshift/'
    require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end
}
