local utils = require("utils")

return {
  "christoomey/vim-tmux-navigator",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "anuvyklack/hydra.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
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
          --   prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
          --   results = { " " },
          --   preview = { " " },
          -- },
        },
        pickers = {
          find_files = {
            previewer = false,
            hidden = true,
            theme = "dropdown",
          },
          oldfiles = {
            previewer = true,
            theme = "dropdown",
          },
          git_files = {
            previewer = true,
            theme = "dropdown",
          },
          commands = {
            theme = "ivy",
          },
          current_buffer_fuzzy_find = {
            previewer = true,
            theme = "dropdown",
          },
          lsp_references = {
            previewer = true,
            theme = "dropdown",
          },
          lsp_document_symbols = {
            previewer = true,
            theme = "dropdown",
          },
          lsp_dynamic_workspace_symbols = {
            previewer = true,
            theme = "dropdown",
          },
          buffers = {
            previewer = false,
            theme = "dropdown",
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
            respect_gitignore = false,
            hidden = true,
            previewer = true,
            cwd_to_path = true,
            select_buffer = true,
            hijack_netrw = true,
            display_stat = false,
          },
        },
      })

      telescope.load_extension("file_browser")

      local Hydra = require("hydra")

      utils.setup_hydra(Hydra, {
        name = "Find",
        body = "<leader>f",
        heads = {
          { "r", "<cmd>Telescope resume<cr>", { silent = true, desc = "Resume search", exit = true } },
          { "f", "<cmd>Telescope find_files<cr>", { silent = true, desc = "Find files", exit = true } },
          { "e", "<cmd>Telescope oldfiles<cr>", { silent = true, desc = "Find recent files", exit = true } },
          { "b", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Find buffers", exit = true } },
          { "g", "<cmd>Telescope git_files<cr>", { silent = true, desc = "Find git files", exit = true } },
          { "l", "<cmd>Telescope live_grep<cr>", { silent = true, desc = "Live grep", exit = true } },
          { "k", "<cmd>Telescope keymaps<cr>", { silent = true, desc = "Find keymaps", exit = true } },
          { "h", "<cmd>Telescope search_history<cr>", { silent = true, desc = "Search history", exit = true } },
          { "c", "<cmd>Telescope git_bcommits<cr>", { silent = true, desc = "Find commits in buffer", exit = true } },
          { "?", "<cmd>Telescope help_tags<cr>", { silent = true, desc = "Find help", exit = true } },
          { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
        },
      })
    end,
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
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },

      {
        "<c-f>",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Find in buffer",
      },

      {
        "<c-b>",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Browse files",
      },
    },
  },
}
