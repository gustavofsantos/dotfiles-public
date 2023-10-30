return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "ThePrimeagen/harpoon",
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
          hijack_netrw = true,
          display_stat = { date = false, size = true, mode = false },
        },
      },
    })

    telescope.load_extension("harpoon")
    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files, { desc = "Find files" })
    vim.keymap.set("n", "<c-f>", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Search" })
    vim.keymap.set(
      "n",
      "<c-b>",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { desc = "Browse files" }
    )

    vim.keymap.set("n", "<F3>", require("telescope.builtin").grep_string, { desc = "Search" })
    vim.keymap.set("v", "<F3>", '"zy:Telescope grep_string default_text=<C-r>z<cr>', { desc = "Search" })

    vim.keymap.set("n", "<leader>fr", function()
      require("telescope.builtin").resume()
    end)
    vim.keymap.set("n", "<leader>fg", function()
      require("telescope.builtin").git_files()
    end)
    vim.keymap.set("n", "<leader>fe", function()
      require("telescope.builtin").oldfiles()
    end)
    vim.keymap.set("n", "<leader>fb", function()
      require("telescope.builtin").buffers()
    end)
    vim.keymap.set("n", "<leader>fm", function()
      require("harpoon.ui").toggle_quick_menu()
    end)
    vim.keymap.set("n", "<leader>fl", function()
      require("telescope.builtin").live_grep()
    end)
    vim.keymap.set("n", "<leader>fk", function()
      require("telescope.builtin").keymaps()
    end)
    vim.keymap.set("n", "<leader>fh", function()
      require("telescope.builtin").search_history()
    end)
    vim.keymap.set("n", "<leader>f?", function()
      require("telescope.builtin").help_tags()
    end)
    vim.keymap.set("n", "<leader>fc", function()
      require("telescope.builtin").git_bcommits()
    end)
    vim.keymap.set("n", "<leader>gb", function()
      require("telescope.builtin").git_branches()
    end)
    vim.keymap.set("n", "<leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find()
    end)
  end,
}
