local telescope = require("telescope")
if (not telescope) then return end

telescope.setup {
  defaults = {
    dynamic_preview_title = true,
  },
  pickers = {
    find_files = {
      disable_devicons = false
    },
    disable_devicons = false
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  },
}

telescope.load_extension('harpoon')
telescope.load_extension("ui-select")
