local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    -- separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    -- offsets = {
    --   {
    --     filetype = "NvimTree",
    --     text = "File Explorer",
    --     highlight = "Directory",
    --     text_align = "left"
    --   }
    -- }
  },
})
