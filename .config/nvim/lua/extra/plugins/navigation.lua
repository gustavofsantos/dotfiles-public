return {
  -- "christoomey/vim-tmux-navigator",
  {
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    config = function()
      require("Navigator").setup()
      vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
      vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
    end
  },
  { -- stevearc/oil.nvim
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = false,
        skip_confirm_for_simple_edits = true,
      })
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open oil" })
    end,
  },
  { -- ThePrimeagen/harpoon
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    event = "VeryLazy",
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({})

      vim.keymap.set("n", "<leader>a",
        function() harpoon:list():add() end,
        { desc = "harpoon file" }
      )

      vim.keymap.set("n", "gh",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "toggle harpoon" }
      )

      vim.keymap.set("n", "<M-1>",
        function() harpoon:list():select(1) end,
        { desc = "slot 1" }
      )

      vim.keymap.set("n", "<M-2>",
        function() harpoon:list():select(2) end,
        { desc = "slot 2" }
      )

      vim.keymap.set("n", "<M-3>",
        function() harpoon:list():select(3) end,
        { desc = "slot 3" }
      )

      vim.keymap.set("n", "<M-4>",
        function() harpoon:list():select(4) end,
        { desc = "slot 4" }
      )
    end,
  },
  { -- nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-dap.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = {
          "kkharji/sqlite.lua",
          { "nvim-telescope/telescope-fzy-native.nvim" },
        },
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          dynamic_preview_title = true,
          prompt_position = "top",
          prompt_prefix = " ",
          selection_caret = "→ ",
          sorting_strategy = "ascending",
          file_ignore_patterns = {
            "%.git/",
            ".git/",
            "node_modules/",
            -- "coverage/",
            "__pycache__/",
          },
          -- layout_strategy = "bottom_pane",
          layout_config = {
            --     vertical = { width = 0.25 },
            --     height = 0.4,
            prompt_position = "top",
          },
          borderchars = {
            prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
            results = { " " },
            preview = { " " },
          },
        },
        pickers = {
          find_files = {
            prompt_prefix = " ",
            theme = "dropdown",
            previewer = true,
            hidden = true,
            disable_devicons = false,
          },
          oldfiles = {
            prompt_prefix = " ",
            previewer = true,
            theme = "dropdown",
            disable_devicons = false,
          },
          live_grep = {
            prompt_prefix = " ",
            previewer = true,
            disable_devicons = false,
          },
          grep_string = {
            prompt_prefix = " ",
            previewer = true,
            prompt_title = false,
            disable_devicons = false,
          },
          git_files = {
            prompt_prefix = " ",
            previewer = true,
            theme= "dropdown",
            disable_devicons = false,
          },
          commands = {
            theme = "dropdown",
          },
          current_buffer_fuzzy_find = {
            prompt_prefix = " ",
            previewer = true,
            theme = "dropdown",
          },
          lsp_references = {
            previewer = true,
            theme = "ivy",
          },
          lsp_document_symbols = {
            previewer = true,
            theme = "ivy",
          },
          lsp_dynamic_workspace_symbols = {
            previewer = true,
            theme = "ivy",
          },
          diagnostics = {
            theme = "dropdown",
          },
          buffers = {
            prompt_prefix = " ",
            previewer = false,
            theme = "dropdown",
            disable_devicons = false,
            mappings = {
              i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          menu = {
            default = {
              items = {
                { "Navigation",      "Telescope menu navigation" },
                { "Version Control", "Telescope menu vcs" }
              }
            },
            navigation = {
              items = {
                { "Find files",        "Telescope find_files" },
                { "Workspace symbols", "Telescope lsp_workspace_symbols" },
                { "Document symbols",  "Telescope lsp_document_symbols" },
              }
            },
            vcs = {
              items = {
                { "Stage hunk",    "Gitsigns stage_hunk" },
                { "Reset hunk",    "Gitsigns reset_hunk" },
                { "Preview hunk",  "Gitsigns preview_hunk" },
                { "Next hunk",     "Gitsigns next_hunk" },
                { "Previous hunk", "Gitsigns prev_hunk" },
              }
            },
            run = {
              items = {}
            }
          }
        },
      })

      telescope.load_extension("smart_open")
      telescope.load_extension("dap")

      -- launch control

      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local themes = require("telescope.themes")
      local conf = require("telescope.config").values
      local log = require("plenary.log").new({})
      log.level = "debug"

      local categories = {
        action = "",
        navigation = "",
        vcs = "",
        lsp = "󰀫",
        problem = "",
      }

      local mappings = {
        { "Find files",            cmd = "Telescope find_files",                               category = "navigation" },
        { "Recent files",          cmd = "Telescope oldfiles",                                 category = "navigation" },
        { "Open files",            cmd = "Telescope buffers",                                  category = "navigation" },
        { "Recent locations",      cmd = "Telescope jumplist theme=dropdown",                  category = "navigation" },
        { "Text search",           cmd = "Telescope current_buffer_fuzzy_find theme=dropdown", category = "navigation" },
        { "Workspace text search", cmd = "Telescope live_grep",                                category = "navigation" },
        { "Commits",               cmd = "Telescope git_commits",                              category = "navigation" },
        { "Branches",              cmd = "Telescope git_branches",                             category = "navigation" },
        { "Symbols",               cmd = "Telescope lsp_document_symbols",                     category = "navigation" },
        { "Classes",               cmd = "Telescope lsp_document_symbols symbols=class",       category = "navigation" },
        { "Functions",             cmd = "Telescope lsp_document_symbols symbols=function",    category = "navigation" },
        { "Variables",             cmd = "Telescope lsp_document_symbols symbols=variable",    category = "navigation" },
        { "Workspace symbols",     cmd = "Telescope lsp_workspace_symbols",                    category = "navigation" },

        -- version control actions
        { "Status",                cmd = "Git",                                                category = "vcs" },
        { "Commit",                cmd = "Git commit",                                         category = "vcs" },
        { "Pull",                  cmd = "Git pull",                                           category = "vcs" },
        { "Push",                  cmd = "Git push",                                           category = "vcs" },
        { "Blame",                 cmd = "Git blame",                                          category = "vcs" },
        { "Stage hunk",            cmd = "Gitsigns stage_hunk",                                category = "vcs" },
        { "Stage buffer",          cmd = "Git add %",                                          category = "vcs" },
        { "Reset hunk",            cmd = "Gitsigns reset_hunk",                                category = "vcs" },
        { "Reset buffer",          cmd = "Gitsigns reset_buffer",                              category = "vcs" },
        { "Preview hunk",          cmd = "Gitsigns preview_hunk",                              category = "vcs" },

        -- problem actions
        { "Buffer diagnostics",    cmd = "Telescope diagnostics bufnr=0",                      category = "problem" },
        { "Workspace diagnostics", cmd = "Telescope diagnostics",                              category = "problem" },

        -- basic actions
        { "Split window",          cmd = "vsplit",                                             category = "action" },
        { "Split window below",    cmd = "split",                                              category = "action" },
        { "Disable formatting",    cmd = "FormatDisable",                                      category = "action" },
        { "Enable formatting",     cmd = "FormatEnable",                                       category = "action" },
        { "Run",                   cmd = "OverseerRun",                                        category = "action" },
        { "Runs",                  cmd = "OverseerToggle",                                     category = "action" },
        { "New tab",               cmd = "tabnew",                                             category = "action" },
        { "Run file",              cmd = "!%",                                                 category = "action" },
        { "Close buffer",          cmd = "bd",                                                 category = "action" },
        { "Quit",                  cmd = "q",                                                  category = "action" },
      }

      local dropdown_theme = themes.get_dropdown({})

      ---@param cmd string
      local execute_cmd = function(cmd)
        vim.cmd(cmd)
      end

      ---@param category string
      local get_category_icon = function(category)
        return categories[category] or ""
      end

      local launch_control = function()
        local opts = {}

        for _, option in ipairs(mappings) do
          if option.nkeymap then
            local keymap = option.nkeymap
            local cmd = option.cmd
            if type(cmd) == "string" then
              vim.api.nvim_set_keymap("n", keymap, "<cmd> " .. cmd .. "<CR>", { noremap = true, silent = true })
            end
          end
        end

        pickers
            .new(dropdown_theme, {
              prompt_title = "Launch Control",
              prompt_prefix = " ",
              sorter = conf.generic_sorter(opts),
              finder = finders.new_table({
                results = mappings,
                entry_maker = function(option)
                  return {
                    value = option,
                    display = get_category_icon(option.category) .. " " .. option[1],
                    ordinal = option[1],
                    cmd = option.cmd,
                  }
                end,
              }),
              attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  if type(selection.cmd) == "function" then
                    selection.cmd(opts)
                  else
                    execute_cmd(selection.cmd)
                  end
                end)

                return true
              end,
            })
            :find()
      end

      vim.api.nvim_create_user_command("LaunchControl", launch_control, {})
      vim.keymap.set("n", "gk", "<cmd>LaunchControl<cr>", { desc = "launch control" })
      vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>",
        { desc = "find file", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>o", "<cmd>Telescope smart_open cwd_only=true<cr>",
        { desc = "find file", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>e", "<cmd>Telescope oldfiles<cr>",
        { desc = "find recent", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>",
        { desc = "find buffer", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",
        { desc = "find symbols", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>",
        { desc = "find resume", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope neoclip<cr>",
        { desc = "find clipboard", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>",
        { desc = "find live", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>",
        { desc = "find git", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>",
        { desc = "find keymaps", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>f?", "<cmd>Telescope help_tags<cr>",
        { desc = "find help", noremap = true, silent = true })
      vim.keymap.set("n", "<c-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        { desc = "find buffer", noremap = true, silent = true })
      vim.keymap.set("v", "<F3>", '"zy:Telescope grep_string default_text=<C-r>z<cr>',
        { desc = "find selected", noremap = true, silent = true })
      vim.keymap.set("n", "<F3>", "<cmd>Telescope grep_string<cr>", { desc = "find word", noremap = true, silent = true })
    end,
  },
}
