return {
  "christoomey/vim-tmux-navigator",
  "christoomey/vim-tmux-runner",
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
    tag = "0.1.8",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
      "ThePrimeagen/git-worktree.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-dap.nvim",
      { "AckslD/nvim-neoclip.lua", dependencies = { "kkharji/sqlite.lua" } },
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
          -- borderchars = {
          --   prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          --   results = { " " },
          --   preview = { " " },
          -- },
        },
        pickers = {
          find_files = {
            prompt_prefix = " ",
            theme = "ivy",
            previewer = true,
            hidden = true,
            disable_devicons = false,
          },
          oldfiles = {
            prompt_prefix = " ",
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          live_grep = {
            prompt_prefix = " ",
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          grep_string = {
            prompt_prefix = " ",
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          git_files = {
            prompt_prefix = " ",
            previewer = true,
            theme = "ivy",
            disable_devicons = false,
          },
          commands = {
            theme = "ivy",
          },
          current_buffer_fuzzy_find = {
            prompt_prefix = " ",
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
          smart_open = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          smart_open = {
            theme = "ivy",
            prompt_prefix = " ",
            cwd_only = true,
            filename_first = true,
          },
        },
      })

      telescope.load_extension("git_worktree")
      telescope.load_extension("smart_open")
      telescope.load_extension("neoclip")
      telescope.load_extension("undo")
      telescope.load_extension("dap")
    end,
    keys = {
      {
        "<leader>p",
        "<cmd>Telescope find_files<cr>",
        { mode = "n", desc = "Find files", noremap = true, silent = true },
      },
      {
        "<leader>o",
        "<cmd>Telescope smart_open theme=ivy<cr>",
        { mode = "n", desc = "Smart open", noremap = true, silent = true },
      },
      {
        "<leader>b",
        "<cmd>Telescope buffers<cr>",
        { mode = "n", desc = "Switch buffer", noremap = true, silent = true },
      },
      {
        "<leader>u",
        "<cmd>Telescope undo theme=ivy<cr>",
        { mode = "n", desc = "Undo history", noremap = true, silent = true },
      },
      {
        "<leader>fr",
        "<cmd>Telescope resume<cr>",
        { mode = "n", desc = "Resume search", noremap = true, silent = true },
      },
      {
        "<leader>fc",
        "<cmd>Telescope neoclip<cr>",
        { mode = "n", desc = "Clipboard history", noremap = true, silent = true },
      },
      {
        "<leader>fl",
        "<cmd>Telescope live_grep<cr>",
        { mode = "n", desc = "Live grep", noremap = true, silent = true },
      },
      {
        "<leader>fg",
        "<cmd>Telescope git_files<cr>",
        { mode = "n", desc = "Find git files", noremap = true, silent = true },
      },
      {
        "<leader>fk",
        "<cmd>Telescope keymaps<cr>",
        { mode = "n", desc = "Keymaps", noremap = true, silent = true },
      },
      {
        "<leader>f?",
        "<cmd>Telescope help_tags<cr>",
        { mode = "n", desc = "Help tags", noremap = true, silent = true },
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
    "b0o/incline.nvim",
    event = "BufEnter",
    config = function()
      local icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        git = {
          added = "",
          changed = "",
          deleted = "",
        },
      }
      local function get_diagnostic_label(props)
        local label = {}
        for severity, icon in pairs(icons.diagnostics) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { icon .. "" .. n .. " ", group = "DiagnosticSign" .. severity })
          end
        end
        return label
      end

      local function get_git_diff(props)
        local icons = { removed = "", changed = "", added = "" }
        local labels = {}
        local success, signs = pcall(vim.api.nvim_buf_get_var, props.buf, "gitsigns_status_dict")
        if success then
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
            end
          end
          return labels
        else
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
            end
          end
          return labels
        end
      end

      local function get_toggleterm_id(props)
        local id = " " .. vim.fn.bufname(props.buf):sub(-1) .. " "
        return { { id, group = props.focused and "Identifier" or "FloatTitle" } }
      end

      local function is_toggleterm(bufnr)
        return vim.bo[bufnr].filetype == "toggleterm"
      end

      require("incline").setup({
        hide = {
          cursorline = true,
          focused_win = false,
          only_win = false,
        },
        window = {
          zindex = 30,
          margin = {
            vertical = { top = vim.o.laststatus == 3 and 0 or 1, bottom = 0 }, -- shift to overlap window borders
            horizontal = { left = 0, right = 2 },
          },
        },
        ignore = {
          buftypes = {},
          filetypes = { "neo-tree", "OverseerList" },
          unlisted_buffers = false,
        },
        render = function(props)
          if is_toggleterm(props.buf) then
            return get_toggleterm_id(props)
          end

          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

          local buffer = {
            { get_git_diff(props) },
            { get_diagnostic_label(props) },
            -- { " " },
            { ft_icon,                    guifg = ft_color },
            { " " },
            { filename,                   group = props.focused and "Identifier" or "TelescopeTitle", gui = "" },
          }
          return buffer
        end,
      })
    end,
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
