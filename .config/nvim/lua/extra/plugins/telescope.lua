local theme = 'dropdown'

return {
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
          "coverage/",
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
          theme = theme,
          previewer = true,
          hidden = true,
        },
        oldfiles = {
          prompt_prefix = " ",
          previewer = true,
          hidden = true,
          theme = theme,
        },
        live_grep = {
          prompt_prefix = " ",
          previewer = true,
          theme = theme,
        },
        grep_string = {
          prompt_prefix = " ",
          previewer = true,
          theme = theme,
          prompt_title = false,
        },
        git_files = {
          prompt_prefix = " ",
          previewer = true,
          theme = theme,
        },
        commands = {
          theme = theme,
        },
        current_buffer_fuzzy_find = {
          prompt_prefix = " ",
          previewer = true,
          theme = theme,
        },
        lsp_references = {
          previewer = true,
          theme = theme,
        },
        lsp_document_symbols = {
          previewer = true,
          theme = theme,
        },
        lsp_dynamic_workspace_symbols = {
          previewer = true,
          theme = theme,
        },
        diagnostics = {
          previewer = true,
          theme = theme,
        },
        buffers = {
          prompt_prefix = " ",
          previewer = false,
          theme = theme,
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("dap")

    -- launch control

    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local themes = require("telescope.themes")
    local conf = require("telescope.config").values

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
    vim.keymap.set("n", "<leader>o", "<cmd>Telescope find_files<cr>",
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
}
