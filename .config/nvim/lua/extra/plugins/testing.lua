return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest-loggi-beyond")({}),
            },
            icons = {
                running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            },
        })

        vim.keymap.set("n", "<leader>tn", require("neotest").run.run, { desc = "Test nearest" })
        vim.keymap.set("n", "<leader>tf", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end, { desc = "Test file" })
        vim.keymap.set("n", "<leader>tl", require("neotest").run.run_last, { desc = "Test last" })
        vim.keymap.set("n", "<leader>to", require("neotest").output.open, { desc = "Test output" })
        vim.keymap.set("n", "<leader>ts", require("neotest").summary.toggle, { desc = "Test summary" })
    end,
}
