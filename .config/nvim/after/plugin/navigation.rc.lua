-- Setup telescope
local has_telescope, telescope = pcall(require, "telescope")
if (has_telescope) then
  telescope.setup {
    defaults = {
      dynamic_preview_title = true,
      prompt_position = "top",
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      -- theme = "ivy",
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        "coverage/",
        "__pycache__/",
      },
      layout_config = {
        vertical = { width = 0.25 },
        prompt_position = "top",
      },
      borderchars = {
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
        preview = { " " },
      },
    },
    pickers = {
      find_files = {
        previewer = true,
        hidden = true,
        theme = "dropdown",
        prompt_prefix = " ",
      },
      git_files = { 
        previewer = true,
        prompt_prefix = " ",
      },
      commands = {
        prompt_prefix = " ",
      },
      buffers = { 
        prompt_prefix = "﬘ ",
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          }
        }
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      file_browser = {
        respect_gitignore = false,
        hidden = true,
        previewer = false,
        cwd_to_path = true,
      },
      coc = {
        prefer_locations = true
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({})
      }
    },
  }

  telescope.load_extension('harpoon')
  telescope.load_extension('ui-select')
  telescope.load_extension('file_browser')
  telescope.load_extension('coc')

  -- find non git-ignored files inside the current dir
  vim.keymap.set('n', '<F3>', require('telescope.builtin').grep_string, { desc = 'Find string' })
  vim.keymap.set('v', '<F3>', "\"zy:Telescope grep_string default_text=<C-r>z<cr>", { desc = 'Find selection' })
end

-- Setup tree view
local has_nvimtree, _ = pcall(require, 'nvim-tree')
if (has_nvimtree) then
  require('nvim-tree').setup {
    respect_buf_cwd = true,
    view = {
      width = 44,
      float = {
        enable = true,
        open_win_config = {
          width = 60,
        },
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    },
    renderer = {
      root_folder_modifier = ":t",
      highlight_git = true,
      icons = {
        show = {
          file = false,
          folder = false
        },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            deleted = "",
            untracked = "",
            ignored = "",
          },
          folder = {
            default = "",
            open = "",
            symlink = "",
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
      special_files = { "package.json", "Makefile", "README.md", "readme.md" },
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
  }
end
