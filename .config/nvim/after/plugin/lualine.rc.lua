local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 0
      }
    },
    lualine_x = { 'diagnostics' },
    lualine_y = { 'branch' },
    lualine_z = {}
  },
  extensions = { 'quickfix', 'nvim-tree', 'toggleterm' }
})
