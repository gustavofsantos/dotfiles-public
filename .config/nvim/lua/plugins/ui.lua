local has_toggleterm, toggleterm = pcall(require, "toggleterm")
if has_toggleterm then
    toggleterm.setup({
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
    })
end

local has_dressing, dressing = pcall(require, "dressing")
if has_dressing then
    dressing.setup({
        select = {
            telescope = require('telescope.themes').get_cursor()
        }
    })
end
