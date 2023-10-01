return {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    dependencies = {
        "akinsho/nvim-toggleterm.lua",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").load_extension("toggleterm")

        require("telescope-toggleterm").setup({
            telescope_mappings = {
                ["<C-c>"] = require("telescope-toggleterm").actions.exit_terminal,
            },
        })
    end,
}
