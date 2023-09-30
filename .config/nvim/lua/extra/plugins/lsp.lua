return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

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
                "tailwindcss",
            },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
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
                local telescope_themes = require("telescope.themes")
                local dropdown = telescope_themes.get_dropdown()

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "gR", function()
                    telescope.lsp_references(dropdown)
                end, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>fs", function()
                    telescope.lsp_document_symbols(dropdown)
                end, opts)
                vim.keymap.set("n", "<leader>fS", function()
                    telescope.lsp_dynamic_workspace_symbols(dropdown)
                end, opts)
            end,
        })
    end
}
