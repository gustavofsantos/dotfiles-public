vim.diagnostic.config({
    virtual_text = true,
})

local has_neodev, neodev = pcall(require, "neodev")
if has_neodev then
    neodev.setup({
        library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
    })
end

local has_mini_completion, _ = pcall(require, "mini.completion")
if has_mini_completion then
    require("mini.completion").setup()
end

local has_mason, mason = pcall(require, "mason")
if has_mason then
    mason.setup()
end

local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if has_mason_lspconfig then
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
    })
end

local has_conform, conform = pcall(require, "conform")
if has_conform then
    conform.setup({
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
            typescript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
            javascriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
            typescriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_fallback = true }
        end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
        else
            vim.g.disable_autoformat = true
        end
    end, {
        desc = "Disable autoformat-on-save",
        bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
    end, {
        desc = "Re-enable autoformat-on-save",
    })
end

local has_lint, lint = pcall(require, "lint")
if has_lint then
    lint.linters_by_ft = {
        markdown = { "vale" },
        python = { "flake8", "ruff" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
    }

    vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
    end, {
        desc = "Lint current buffer",
    })
end

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
    end,
})
