return {
  "tpope/vim-sleuth",
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "undo tree", noremap = true, silent = true })
    end
  },
  {
    'echasnovski/mini.clue',
    version = false,
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        window = { delay = 500 },
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({ submode_resize = true }),
          miniclue.gen_clues.z(),
        },
      })
    end
  },
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
