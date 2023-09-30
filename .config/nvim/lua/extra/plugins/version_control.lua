return {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            signcolumn = true,
            numhl = false,
            linehl = false,
            attach_to_untracked = false,
            current_line_blame = false,
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        })
    end,
    keys = {
        { "]h",         "<cmd>Gitsigns next_hunk<cr>" },
        { "[h",         "<cmd>Gitsigns prev_hunk<cr>" },
        { "gH",         "<cmd>Gitsigns preview_hunk<cr>" },
        { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>" },
        { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>" },
        { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>" }
    }
}
