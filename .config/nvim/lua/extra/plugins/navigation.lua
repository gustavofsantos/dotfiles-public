return {
  "christoomey/vim-tmux-navigator",
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<M-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        mode = { "n" },
        desc = "Navigate to file in slot 1",
      },
      {
        "<M-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        mode = { "n" },
        desc = "Navigate to file in slot 2",
      },
      {
        "<M-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        mode = { "n" },
        desc = "Navigate to file in slot 3",
      },
      {
        "<M-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        mode = { "n" },
        desc = "Navigate to file in slot 4",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "ThePrimeagen/git-worktree.nvim",
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
          diagnostics = {
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

      telescope.load_extension("git_worktree")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
      })
    end,
    keys = {
      { "<C-b>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
    },
  },
}
