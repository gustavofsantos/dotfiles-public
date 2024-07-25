return {
  { -- Move any selection in any direction
    -- Move up......................... <A-k>
    -- Move down....................... <A-j>
    -- Move left....................... <A-h>
    -- Move right...................... <A-l>
    "echasnovski/mini.move",
    event = "BufRead",
    opts = {},
  },
  { -- Go forward/backward with square brackets
    -- Buffer.......................... [B [b ]b ]B
    -- Comment block................... [C [c ]c ]C
    -- Conflict marker................. [X [x ]x ]X
    -- Diagnostic...................... [D [d ]d ]D
    -- File on disk.................... [F [f ]f ]F
    -- Indent change................... [I [i ]i ]I
    -- Jump from |jumplist|
    -- inside current buffer........... [J [j ]j ]J
    -- Location from |location-list|... [L [l ]l ]L
    -- Old files....................... [O [o ]o ]O
    -- Quickfix entry from |Quickfix|.. [Q [q ]q ]Q
    -- Tree-sitter node and parents.... [T [t ]t ]T
    -- Undo states from specially
    -- tracked linear history.......... [U [u ]u ]U
    -- Window in current tab........... [W [w ]w ]W
    -- Yank selection replacing
    -- latest put region................[Y [y ]y ]Y
    "echasnovski/mini.bracketed",
    event = "BufRead",
    opts = {}
  },
  { -- Highlight hex color strings (`#rrggbb`) using that color
    "echasnovski/mini.hipatterns",
    event = "BufRead",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
