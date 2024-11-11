local theme = 'dropdown'

return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")

      vim.keymap.set("n", "<leader>o",
        function()
          require("telescope").extensions.smart_open.smart_open({
            cwd_only = true,
            filename_first = true,
            theme = theme
          })
        end,
        { desc = "find file", noremap = true, silent = true })
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("frecency")

      vim.keymap.set("n", "<leader>e", "<cmd>Telescope frecency workspace=CWD theme=" .. theme .. "<cr>",
        { desc = "find recent", noremap = true, silent = true })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      local state = require("telescope.actions.state")
      local builtin = require("telescope.builtin")
      local launch_control = require("telescope.launch_control")
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
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-r>"] = function()
                builtin.resume({
                  prompt_title = "[Current] |  Find Files  |  Symbols  |  Actions  |  Text ",
                  default_text = state.get_current_line()
                })
              end,
              ["<C-f>"] = function()
                builtin.find_files({
                  prompt_title = " Current  | [Find Files] |  Symbols  |  Actions  |  Text ",
                  default_text = state.get_current_line()
                })
              end,
              ["<C-m>"] = function()
                builtin.lsp_document_symbols({
                  prompt_title = " Current  |  Find Files  | [Symbols] |  Actions  |  Text ",
                  default_text = state.get_current_line()
                })
              end,
              ["<C-t>"] = function()
                builtin.grep_string({
                  prompt_title = " Current  |  Find Files  |  Symbols  |  Actions  | [Text]",
                  default_text = state.get_current_line()
                })
              end,
              ["<C-a>"] = function()
                launch_control.launch_control()
              end,
            }
          }
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

      vim.keymap.set("n", "gk", launch_control.launch_control, { desc = "launch control" })

      vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>",
        { desc = "find file", noremap = true, silent = true })

      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>",
        { desc = "find resume", noremap = true, silent = true })

      vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>",
        { desc = "find live", noremap = true, silent = true })

      vim.keymap.set("n", "<c-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        { desc = "find buffer", noremap = true, silent = true })

      vim.keymap.set("v", "<F3>", '"zy:Telescope grep_string default_text=<C-r>z<cr>',
        { desc = "find selected", noremap = true, silent = true })

      vim.keymap.set("n", "<F3>", "<cmd>Telescope grep_string<cr>", { desc = "find word", noremap = true, silent = true })
    end,
  }
}
