return {
  { "echasnovski/mini.move", event = "BufRead", opts = {} },
  { "echasnovski/mini.bracketed", event = "BufRead", opts = {} },
  {
    "echasnovski/mini.hipatterns",
    event = "BufRead",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
