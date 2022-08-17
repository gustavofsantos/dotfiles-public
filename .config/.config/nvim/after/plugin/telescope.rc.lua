local telescope = require("telescope")
if (not telescope) then return end

telescope.setup {
  defaults = {
    dynamic_preview_title = true
  },
  extensions = {
    ["ui-select"] = {
      require('telescope.themes').get_dropdown { }
    }
  }
}

telescope.load_extension('harpoon')
telescope.load_extension('ui-select')
