return {
  { "echasnovski/mini.move", lazy = false, opts = {} },
  { "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
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
