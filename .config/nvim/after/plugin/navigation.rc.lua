-- Setup telescope
local has_telescope, telescope = pcall(require, "telescope")
if (has_telescope) then
  telescope.setup {
    defaults = {
      dynamic_preview_title = true,
      prompt_prefix = "🔍 ",
      theme = "ivy"
    },
    pickers = {
      find_files = { theme = "ivy" },
      git_files = { theme = "ivy" },
      oldfiles = { theme = "ivy" },
      buffers = { theme = "ivy" },
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
      -- disable_devicons = false
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

  -- find non git-ignored files inside the current dir
  vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esumed search'})
  vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]ile'})
  vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = '[F]ind [G]it file'})
  vim.keymap.set('n', '<leader>fe', require('telescope.builtin').oldfiles, { desc = '[F]ind r[e]cently opened files' })
  vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind open [B]uffer' })
  vim.keymap.set('n', '<leader>fj', require('telescope.builtin').jumplist, { desc = '[F]ind [J]umps' })
  vim.keymap.set('n', '<leader>fo', require('telescope.builtin').loclist, { desc = '[F]ind l[o]cation list' })
  vim.keymap.set('n', '<leader>fl', require('telescope.builtin').live_grep, { desc = '[F]ind by [L]ive grep' })
  vim.keymap.set('n', '<leader>ft', require('telescope.builtin').diagnostics, { desc = '[F]ind [T]roubles' })
  vim.keymap.set('n', '<leader>f?', require('telescope.builtin').help_tags, { desc = '[F]ind [?]help' })
  vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_bcommits, { desc = '[F]ind git [C]ommits' })
  vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = '[G]it checkout [B]ranch' })
  vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Fuzzily search in current buffer]' })
  vim.keymap.set('n', '<F3>', require('telescope.builtin').grep_string, { desc = 'Find string' })
  vim.keymap.set('v', '<F3>', "\"zy:Telescope grep_string default_text=<C-r>z<cr>", { desc = 'Find selection' })
end

-- Setup harpoon
local has_harpoon, harpoon = pcall(require, "harpoon")
if (has_harpoon) then
  harpoon.setup {  }

  -- mark file with harpoon
  vim.keymap.set("n", "<leader>am", require('harpoon.mark').add_file)
  vim.keymap.set("n", "<leader>]m", require('harpoon.ui').nav_next, { desc = "Next [M]ark" })
  vim.keymap.set("n", "<leader>[m", require('harpoon.ui').nav_prev, { desc = "Previous [M]ark" })
  vim.keymap.set("n", "<leader>fm", require("harpoon.ui").toggle_quick_menu, { desc = "[F]ind [M]arks" }) -- find marks
end

-- Setup tree view
local has_nvimtree, nvimtree = pcall(require, 'nvim-tree')
if (has_nvimtree) then
  local gwidth = vim.api.nvim_list_uis()[1].width
  local gheight = vim.api.nvim_list_uis()[1].height
  local width = 80
  local height = 30

  nvimtree.setup {
    respect_buf_cwd = true,
    view = {
      -- width = 36,
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          -- border = "rounded",
          width = width,
          height = height,
          row = (gheight - height) * 0.4,
          col = (gwidth - width) * 0.5,
        },
      }
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true
        }
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
