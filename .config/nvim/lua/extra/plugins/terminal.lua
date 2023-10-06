return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-t>]],
    terminal_mappings = true,
    direction = "horizontal",
    size = 24,
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
  keys = {
    { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Terminal switch" },
  },
}
