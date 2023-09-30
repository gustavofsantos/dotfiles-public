return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "ThePrimeagen/harpoon",
        "stevearc/dressing.nvim"
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
                layout_strategy = "bottom_pane",
                layout_config = {
                    vertical = { width = 0.25 },
                    height = 0.4,
                    prompt_position = "top",
                },
                borderchars = {
                    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                    results = { " " },
                    preview = { " " },
                },
            },
            pickers = {
                find_files = {
                    previewer = true,
                    hidden = true,
                    theme = "dropdown"
                },
                git_files = {
                    previewer = true,
                    theme = "ivy",
                },
                commands = {
                    theme = "ivy",
                },
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                },
                buffers = {
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
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                file_browser = {
                    respect_gitignore = false,
                    hidden = true,
                    previewer = true,
                    cwd_to_path = true,
                    hijack_netrw = true,
                    display_stat = { date = false, size = true, mode = false },
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        telescope.load_extension("harpoon")
        telescope.load_extension("file_browser")

        require("dressing").setup({
            select = {
                telescope = require('telescope.themes').get_cursor()
            }
        })

        vim.keymap.set('n', "<F3>", require("telescope.builtin").grep_string, { desc = "Search" })
        vim.keymap.set('v', "<F3>", '"zy:Telescope grep_string default_text=<C-r>z<cr>', { desc = "Search" })
    end,
}
