return {
  "neovim/nvim-lspconfig",
  event = { "BufEnter", "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "nvimdev/lspsaga.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    require("lspsaga").setup({
      lightbulb = { enable = false },
      symbol_in_winbar = { enable = false },
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
        require("neodev").setup()
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

        vim.keymap.set("n", "gO", "<cmd>Lspsaga outline<cr>", opts)
        vim.keymap.set("n", "gF", "<cmd>Lspsaga finder<cr>", opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
        vim.keymap.set("n", "gR", function()
          telescope.lsp_references({
            include_declaration = false,
            show_line = false,
          })
        end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", "<leader>fs", function()
          telescope.lsp_document_symbols()
        end, opts)
        vim.keymap.set("n", "<leader>fS", function()
          telescope.lsp_dynamic_workspace_symbols()
        end, opts)
      end,
    })

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      update_in_insert = true,
      float = {
        source = "always", -- Or "if_many"
      },
    })
  end,
}