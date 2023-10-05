return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })

      vim.keymap.set(
        "v",
        "<leader>b",
        ':<C-U>!git blame <C-R>=expand("%:p") <CR> \\| sed -n <C-R>=line("\'<") <CR>,<C-R>=line("\'>") <CR>p <CR>'
      )
    end,
    keys = {
      { "<leader>gs", "<cmd>Git<cr>" },
      { "]h", "<cmd>Gitsigns next_hunk<cr>" },
      { "[h", "<cmd>Gitsigns prev_hunk<cr>" },
      { "gH", "<cmd>Gitsigns preview_hunk<cr>" },
      { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>" },
      { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>" },
      { "dgu", "<cmd>diffget //2<cr>" },
      { "dgl", "<cmd>diffget //3<cr>" },
    },
  },
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
