return {
  "christoomey/vim-tmux-navigator",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      {
        "<F3>",
        function()
          require("telescope.builtin").grep_string()
        end,
        mode = { "n" },
        desc = "Search",
      },

      {
        "<F3>",
        '"zy:Telescope grep_string default_text=<C-r>z<cr>',
        mode = { "v" },
        desc = "Search",
      },

      {
        "<c-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },

      {
        "<c-f>",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Find in buffer",
      },

      {
        "<c-b>",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Browse files",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          dynamic_preview_title = true,
          prompt_position = "top",
          prompt_prefix = " ",
          selection_caret = " ",
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
          -- borderchars = {
          --   prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          --   results = { " " },
          --   preview = { " " },
          -- },
        },
        pickers = {
          find_files = {
            theme = "ivy",
            previewer = false,
            hidden = true,
          },
          oldfiles = {
            previewer = true,
            theme = "ivy",
          },
          git_files = {
            previewer = true,
            theme = "ivy",
          },
          commands = {
            theme = "ivy",
          },
          current_buffer_fuzzy_find = {
            previewer = true,
            theme = "ivy",
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
          buffers = {
            previewer = false,
            theme = "ivy",
            mappings = {
              i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
              },
            },
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
            theme = "ivy",
            respect_gitignore = false,
            hidden = true,
            previewer = false,
            cwd_to_path = true,
            select_buffer = true,
            hijack_netrw = true,
            display_stat = false,
          },
        },
      })

      telescope.load_extension("file_browser")
    end,
  },
}
