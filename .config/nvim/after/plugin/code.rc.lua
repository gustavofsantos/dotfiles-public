vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local has_mini_move, mini_move = pcall(require, "mini.move")
if has_mini_move then
    mini_move.setup()
end

local has_mini_splitjoin, mini_splitjoin = pcall(require, "mini.splitjoin")
if has_mini_splitjoin then
    mini_splitjoin.setup()
end

local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if has_treesitter then
    treesitter.setup({
        -- A list of parser names, or "all"
        ensure_installed = {
            "gitcommit",
            "git_rebase",
            "bash",
            "go",
            "lua",
            "json",
            "proto",
            "toml",
            "rust",
            "haskell",
            "markdown",
            "javascript",
            "jsdoc",
            "typescript",
            "tsx",
            "prisma",
            "python",
            "vim",
            "elixir",
            "css",
            "eex",
            "heex",
            "svelte",
        },
        highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-space>",
                node_incremental = "<c-space>",
                scope_incremental = "<c-s>",
                node_decremental = "<c-backspace>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
        context_commentstring = {
            enable = true,
        },
    })

    require("nvim-treesitter.configs").setup({
        autotag = {
            enable = true,
        },
    })
end
