return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
        open_mapping = [[<c-t>]],
        terminal_mappings = true,
        direction = "horizontal",
        size = 20,
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    },
}
