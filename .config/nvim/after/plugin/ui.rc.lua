-- Setup lualine
-- local has_lualine, lualine = pcall(require, 'lualine')
-- if (has_lualine) then
--   lualine.setup({
--     options = {
--       icons_enabled = true,
--       theme = 'auto',
--       component_separators = { left = '', right = '' },
--       section_separators = { left = '', right = '' },
--       always_divide_middle = true,
--       globalstatus = false,
--       refresh = {
--         statusline = 1000,
--         tabline = 1000,
--         winbar = 1000,
--       }
--     },
--     sections = {
--       lualine_a = {},
--       lualine_b = {
--       },
--       lualine_c = {
--         -- 'branch',
--         -- 'diff',
--         {
--           'filename',
--           file_status = true,
--           path = 1
--         },
--       },
--       lualine_x = {
--         'diagnostics',
--         'location',
--         'filetype'
--       },
--       lualine_y = {},
--       lualine_z = {}
--     },
--     inactive_sections = {
--       lualine_a = {},
--       lualine_b = {
--         {
--           'filename',
--           file_status = true,
--           path = 1
--         }
--       },
--       lualine_c = {},
--       lualine_x = {},
--       lualine_y = {},
--       lualine_z = {}
--     },
--     extensions = { 'quickfix', 'nvim-tree', 'toggleterm' }
--   })
-- end

-- Setup toggle term
local has_toggleterm, toggleterm = pcall(require, "toggleterm")
if (has_toggleterm) then
  toggleterm.setup {
    direction = 'horizontal',
    size = 20,
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    },
  }
end

local has_colorizer, colorizer = pcall(require, 'colorizer')
if (has_colorizer) then
  colorizer.setup()
end

