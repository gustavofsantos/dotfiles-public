return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim"
    },
    event = "VeryLazy",
    config = function()
        require("neotest").setup({
            adapters = {
                require('neotest-jest-loggi-beyond')({})
            },
            icons = {
                running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            },
        })
    end
}
