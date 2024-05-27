return {
  "christoomey/vim-tmux-navigator",
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    event = "VeryLazy",
    config = function()
      local hp = require("harpoon")
      hp:setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        { desk = "Add file to harpoon" },
      },
      {
        "<leader>ht",
        function()
          local hp = require("harpoon")
          hp.ui:toggle_quick_menu(hp:list())
        end,
        { desk = "View marks" },
      },
      {
        "<M-1>",
        function()
          require("harpoon"):list():select(1)
        end,
        { desk = "Navigate to file in slot 1" },
      },
      {
        "<M-2>",
        function()
          require("harpoon"):list():select(2)
        end,
        { desk = "Navigate to file in slot 2" },
      },
      {
        "<M-3>",
        function()
          require("harpoon"):list():select(3)
        end,
        { desk = "Navigate to file in slot 3" },
      },
      {
        "<M-4>",
        function()
          require("harpoon"):list():select(4)
        end,
        { desk = "Navigate to file in slot 4" },
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
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          dynamic_preview_title = true,
          prompt_position = "top",
          prompt_prefix = "↳ ",
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
            disable_devicons = false,
          },
          oldfiles = {
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          live_grep = {
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          grep_string = {
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          git_files = {
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
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
    keys = {
      {
        "<leader>p",
        "<cmd>Telescope find_files<cr>",
        { mode = "n", desc = "Find files", noremap = true, silent = true },
      },
      {
        "<leader>o",
        "<cmd>Telescope oldfiles<cr>",
        { mode = "n", desc = "Open recent files", noremap = true, silent = true },
      },
      {
        "<leader>b",
        "<cmd>Telescope buffers<cr>",
        { mode = "n", desc = "Switch buffer", noremap = true, silent = true },
      },
      {
        "<c-f>",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        { mode = "n", desc = "Find in buffer", noremap = true, silent = true },
      },
      {
        "<F3>",
        "<cmd>Telescope grep_string<cr>",
        { mode = "n", desc = "Grep word under cursor", noremap = true, silent = true },
      },
      {
        "<F3>",
        '"zy:Telescope grep_string default_text=<C-r>z<cr>',
        { mode = "v", desc = "Grep selected text", noremap = true, silent = true },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open oil" } },
    },
  },
}
