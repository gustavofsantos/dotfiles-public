return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufEnter", "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neodev").setup()

      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
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
          -- "ltex",
        },
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        -- ["ltex"] = function()
        --   local lspconfig = require("lspconfig")
        --
        --   lspconfig.ltex.setup({
        --     settings = {
        --       ltex = {
        --         language = { "pt-BR" },
        --       },
        --     },
        --   })
        -- end,
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
        ["ts_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.ts_ls.setup({
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
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<leader>xx", telescope.diagnostics, { buffer = ev.buf, desc = "Buffer diagnostics" })

          vim.keymap.set("n", "<leader>xw", function()
            require("telescope.builtin").diagnostics({ bufno = 0 })
          end, { buffer = ev.buf, desc = "Workspace diagnostics" })

          vim.keymap.set("n", "<leader>th", function()
            local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
            vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
          end, { noremap = true, silent = true, desc = "Toggle inlay hints" })
        end,
      })

      -- Diagnostic symbols in the sign column (gutter)
      --
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        -- virtual_text = {
        --   prefix = "■",
        -- },
        virtual_text = false,
        update_in_insert = false,
        float = {
          source = "if_many",
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    enabled = false,
    opts = {},
  },
}
