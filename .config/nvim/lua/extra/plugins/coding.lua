return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup({
        settings = {
          options = {
            debug = true
          }
        }
      })
    end,
    -- keys = {
    --   { ",v", "<cmd>VenvSelect<cr>" },
    -- },
  },
  {
    "AndrewRadev/switch.vim",
    config = function()
      vim.cmd([[let g:switch_custom_definitions =
          \ [
          \   {
          \     '^\(.*\)TODO\(.*\)$': '\1DOING\2',
          \     '^\(.*\)DOING\(.*\)$': '\1DONE\2',
          \     '^\(.*\)DONE\(.*\)$': '\1TODO\2',
          \     '^\(.*\)\[ \]\(.*\)$': '\1\[/\]\2',
          \     '^\(.*\)\[/\]\(.*\)$': '\1\[x\]\2',
          \     '^\(.*\)\[x\]\(.*\)$': '\1\[ \]\2',
          \     'it': 'fit',
          \     'fit': 'xit',
          \     'xit': 'it',
          \     'true': 'false',
          \     'false': 'true',
          \     'True': 'False',
          \     'False': 'True',
          \   }
          \ ]
      ]])
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()

      vim.keymap.set({ "n", "x" },
        "<leader>cr",
        function() require('refactoring').select_refactor() end,
        { noremap = true, silent = true, desc = "refactor" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    ft = { "python" },
    event = "VeryLazy",
    config = function()
      require("dapui").setup({
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
          },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = "",
        },
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.5,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              {
                id = "stacks",
                size = 0.25,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5,
              },
              {
                id = "console",
                size = 0.5,
              },
            },
            position = "bottom",
            size = 10,
          },
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      })
      local dap, dapui = require("dap"), require("dapui")

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- see: https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#debugpy
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

      vim.keymap.set("n", "<leader>cdu", dapui.toggle, { desc = "toggle dap ui" })
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "continue" })
      vim.keymap.set("n", "<F8>", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "step over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "step into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "step out" })
      -- wk.add({
      --   { "<leader>cd", group = "debugger" },
      --   {
      --     "<leader>cdh",
      --     function()
      --       require("dap.ui.widgets").hover()
      --     end,
      --     desc = "hover",
      --     mode = { "n", "v" },
      --   },
      --   {
      --     "<leader>cdp",
      --     function()
      --       require("dap.ui.widgets").preview()
      --     end,
      --     desc = "preview",
      --     mode = { "n", "v" },
      --   },
      --   {
      --     "<leader>cdf",
      --     "<cmd>Telescope dap frames theme=ivy<cr>",
      --     desc = "frames",
      --   },
      --   {
      --     "<leader>cda",
      --     "<cmd>Telescope dap list_breakpoints theme=ivy<cr>",
      --     desc = "breakpoints",
      --   },
      --   {
      --     "<leader>cdv",
      --     "<cmd>Telescope dap variables theme=ivy<cr>",
      --     desc = "variables",
      --   },
      --   {
      --     "<leader>cd;",
      --     "<cmd>Telescope dap commands theme=dropdown<cr>",
      --     desc = "commands",
      --   },
      --   {
      --     "<leader>cdr",
      --     function()
      --       require("dap").repl.toggle()
      --     end,
      --     desc = "toggle repl",
      --   },
      --   {
      --     "<leader>cdl",
      --     function()
      --       require("dap").run_last()
      --     end,
      --     desc = "run last",
      --   },
      -- })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "tpope/vim-projectionist",
    event = "BufRead",
    keys = {
      { "ga", "<cmd>A<CR>", desc = "Alternate file" },
    },
    config = function()
      vim.g.projectionist_heuristics = {
        ["*"] = {
          ["*.js"] = {
            alternate = {
              "{dirname}/{basename}.test.js",
            },
            type = "source",
          },
          ["*.test.js"] = {
            alternate = "{basename}.js",
            type = "test",
          },
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = true,
    config = function()
      require("copilot").setup({
        filetypes = {
          lua = true,
          shell = true,
          sh = true,
          yaml = true,
          python = true,
          html = true,
          ["*"] = false,
        },
        suggestion = { enabled = true, auto_trigger = true, debounce = 200 },
        panel = { enabled = true, auto_refresh = true },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nix-profile/bin/node",
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    enabled = false,
    event = "BufRead",
    config = function()
      vim.o.foldcolumn = "0" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local ufo = require("ufo")
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      ufo.setup({
        open_fold_hl_timeout = 150,
        fold_virt_text_handler = handler,
        enable_get_fold_virt_text = true,
        close_fold_kinds_for_ft = {},
        preview = {
          win_config = {
            border = { "", "", "", "", "", "", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
          mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
            jumpTop = "[",
            jumpBot = "]",
          },
        },
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })

      vim.keymap.set("n", "zR", ufo.openAllFolds)
      vim.keymap.set("n", "zM", ufo.closeAllFolds)
    end,
  },
}
