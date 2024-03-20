return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-t>]],
    terminal_mappings = true,
    direction = "horizontal",
    shade_terminals = true,
    shading_factor = vim.o.background == "dark" and 0 or 0,
    size = 38,
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
