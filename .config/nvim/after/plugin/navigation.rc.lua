-- Setup telescope
local has_telescope, telescope = pcall(require, "telescope")
if (has_telescope) then
  telescope.setup {
    defaults = {
      dynamic_preview_title = true,
      prompt_prefix = "> ",
      theme = "ivy",
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        "coverage/",
        "__pycache__/",
      }
    },
    pickers = {
      find_files = { theme = "ivy", previewer = false, hidden = true },
      git_files = { theme = "ivy", previewer = false },
      search_history = { theme = "ivy" },
      oldfiles = { theme = "ivy" },
      buffers = { 
        theme = "ivy",
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          }
        }
      },
      jumplist = { theme = "ivy" },
      loclist = { theme = "ivy" },
      live_grep = { theme = "ivy" },
      grep_string = { theme = "ivy" },
      diagnostics = { theme = "ivy" },
      help_tags = { theme = "ivy" },
      git_bcommits = { theme = "ivy" },
      git_branches = { theme = "ivy" },
      current_buffer_fuzzy_find = { theme = "ivy" },
      lsp_references = { theme = "ivy "},
      lsp_document_symbols = { theme = "ivy" },
      lsp_workspace_symbols = { theme = "ivy" },
      lsp_dynamic_workspace_symbols = { theme = "ivy" },
      keymaps = { theme = "ivy" }
      -- disable_devicons = false
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      file_browser = {
        theme = "dropdown",
        respect_gitignore = false,
        hidden = true,
        previewer = false,
        cwd_to_path = true,
        hijack_netrw = true,
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        }
      }
    },
  }

  telescope.load_extension('harpoon')
  telescope.load_extension('ui-select')
  telescope.load_extension('file_browser')

  -- find non git-ignored files inside the current dir
  vim.keymap.set('n', '<F3>', require('telescope.builtin').grep_string, { desc = 'Find string' })
  vim.keymap.set('v', '<F3>', "\"zy:Telescope grep_string default_text=<C-r>z<cr>", { desc = 'Find selection' })
end

-- Setup tree view
local has_nvimtree, nvimtree = pcall(require, 'nvim-tree')
if (has_nvimtree) then
  nvimtree.setup {
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
