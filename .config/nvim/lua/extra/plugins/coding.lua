return {
  "tpope/vim-sleuth",
  "mbbill/undotree",
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
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    ft = { "python" },
    event = "VeryLazy",
    config = function()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")

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
    end,
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<F8>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Hover",
        mode = { "n", "v" },
      },
      {
        "<leader>dp",
        function()
          require("dap.ui.widgets").preview()
        end,
        desc = "Preview",
        mode = { "n", "v" },
      },
      {
        "<leader>df",
        "<cmd>Telescope dap frames theme=ivy<cr>",
        desc = "Frames",
      },
      {
        "<leader>da",
        "<cmd>Telescope dap list_breakpoints theme=ivy<cr>",
        desc = "List breakpoints",
      },
      {
        "<leader>dv",
        "<cmd>Telescope dap variables theme=ivy<cr>",
        desc = "Variables",
      },
      {
        "<leader>d;",
        "<cmd>Telescope dap commands theme=dropdown<cr>",
        desc = "Commands",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run last",
      },
    },
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
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/twilight.nvim",
    opts = {},
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
    event = "BufRead",
    config = function()
      vim.o.foldcolumn = "0" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
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
  {
    "b0o/incline.nvim",
    event = "BufEnter",
    config = function()
      local icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
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
        return { { id, group = props.focused and "FloatTitle" or "Title" } }
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
          margin = {
            horizontal = 1,
            vertical = 2,
          },
          placement = {
            horizontal = "right",
            vertical = "top",
          },
        },
        render = function(props)
          if is_toggleterm(props.buf) then
            return get_toggleterm_id(props)
          end

          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

          local buffer = {
            -- { get_git_diff(props) },
            { get_diagnostic_label(props) },
            { ft_icon, guifg = ft_color },
            { " " },
            { filename, gui = modified },
          }
          return buffer
        end,
      })

      vim.opt.laststatus = 3
    end,
  },
}
