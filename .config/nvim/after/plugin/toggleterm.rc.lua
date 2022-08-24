local toggleterm = require("toggleterm")
if (not toggleterm) then return end

toggleterm.setup {
  -- direction = 'tab'
  size = 28,
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
