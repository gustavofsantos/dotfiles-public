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

      vim.keymap.set("n", "<leader>ha", function()
        hp:list():append()
      end, { desc = "Add file to harpoon" })
      vim.keymap.set("n", "<leader>ht", function()
        hp.ui:toggle_quick_menu(hp:list())
      end, { desc = "View marks" })

      vim.keymap.set("n", "<M-1>", function()
        hp:list():select(1)
      end, { desc = "Navigate to file in slot 1" })
      vim.keymap.set("n", "<M-2>", function()
        hp:list():select(2)
      end, { desc = "Navigate to file in slot 2" })
      vim.keymap.set("n", "<M-3>", function()
        hp:list():select(3)
      end, { desc = "Navigate to file in slot 3" })
      vim.keymap.set("n", "<M-4>", function()
        hp:list():select(4)
      end, { desc = "Navigate to file in slot 4" })
    end,
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

      vim.keymap.set(
        "n",
        "<leader>fx",
        "<cmd>Telescope commands<cr>",
        { desc = "Commands", noremap = true, silent = true }
      )

      vim.keymap.set(
        "n",
        "<F3>",
        "<cmd>Telescope grep_string<cr>",
        { desc = "Grep word under cursor", noremap = true, silent = true }
      )
      vim.keymap.set(
        "v",
        "<F3>",
        '"zy:Telescope grep_string default_text=<C-r>z<cr>',
        { desc = "Grep selected text", noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<c-p>",
        "<cmd>Telescope find_files<cr>",
        { desc = "Find files", noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<c-f>",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        { desc = "Find in buffer", noremap = true, silent = true }
      )
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
            hide_gitignored = false,
            hide_hidden = false,
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
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      })

      vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<cr>")
    end,
  },
}
