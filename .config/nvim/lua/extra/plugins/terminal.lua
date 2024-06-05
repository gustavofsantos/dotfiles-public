return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "BufEnter",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      shade_terminals = false,
      start_in_insert = false,
    })
  end,
}
