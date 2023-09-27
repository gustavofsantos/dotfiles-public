-- Setup toggle term
local has_toggleterm, toggleterm = pcall(require, "toggleterm")
if has_toggleterm then
    toggleterm.setup({
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
