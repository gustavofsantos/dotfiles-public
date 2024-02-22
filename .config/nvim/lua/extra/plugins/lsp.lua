return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufEnter", "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "dnlhc/glance.nvim",
      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neodev").setup()

      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local glance = require("glance")
      local actions = glance.actions
      glance.setup({
        mappings = {
          list = {
            ["j"] = actions.next, -- Bring the cursor to the next item in the list
            ["k"] = actions.previous, -- Bring the cursor to the previous item in the list
            ["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
            ["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
            ["<C-u>"] = actions.preview_scroll_win(5),
            ["<C-d>"] = actions.preview_scroll_win(-5),
            ["s"] = actions.jump_vsplit,
            ["S"] = actions.jump_split,
            ["t"] = actions.jump_tab,
            ["<CR>"] = actions.jump,
            ["o"] = actions.jump,
            ["l"] = actions.open_fold,
            ["h"] = actions.close_fold,
            ["<leader>l"] = actions.enter_win("preview"), -- Focus preview window
            ["q"] = actions.close,
            ["Q"] = actions.close,
            ["<Esc>"] = actions.close,
            ["<C-q>"] = actions.quickfix,
            -- ['<Esc>'] = false -- disable a mapping
          },
          preview = {
            ["Q"] = actions.close,
            ["<Tab>"] = actions.next_location,
            ["<S-Tab>"] = actions.previous_location,
            ["<leader>l"] = actions.enter_win("list"), -- Focus list window
          },
        },
      })

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "dockerls",
          "docker_compose_language_service",
          "eslint",
          "jsonls",
          "yamlls",
          "svelte",
          "vimls",
          "bashls",
          "marksman",
        },
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")

          lspconfig.lua_ls.setup({
            single_file_support = true,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                },
                completion = {
                  workspaceWord = true,
                  callSnippet = "Both",
                },
              },
            },
          })
        end,
        ["tsserver"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tsserver.setup({
            root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          require("lspconfig").jsonls.setup({
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
        ["yamlls"] = function()
          require("lspconfig").yamlls.setup({
            settings = {
              yaml = {
                schemaStore = {
                  enable = false,
                  url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
              },
            },
          })
        end,
        ["pyright"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.pyright.setup({
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
        ["denols"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.denols.setup({
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
          })
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          local telescope = require("telescope.builtin")

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gT", telescope.treesitter, opts)
          vim.keymap.set("n", "gd", "<cmd>Glance definitions<cr>", opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", "<cmd>Glance implementations<cr>", opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "gR", "<cmd>Glance references<cr>", opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>fs", function()
            telescope.lsp_document_symbols()
          end, { buffer = ev.buf, desc = "Find document symbols" })
          vim.keymap.set("n", "<leader>fS", function()
            telescope.lsp_dynamic_workspace_symbols()
          end, { buffer = ev.buf, desc = "Find workspace symbols" })
        end,
      })

      -- Diagnostic symbols in the sign column (gutter)
      local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        update_in_insert = false,
        float = {
          source = "if_many",
        },
      })
    end,
    keys = {
      {
        "<leader>xx",
        function()
          require("telescope.builtin").diagnostics()
        end,
        mode = { "n" },
        desc = "Workspace diagnostics",
      },
      {
        "<leader>xd",
        function()
          require("telescope.builtin").diagnostics({ bufno = 0 })
        end,
        mode = { "n" },
        desc = "Document diagnostics",
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },
}
