return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    priority = 1,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    dependencies = {
      "ThePrimeagen/refactoring.nvim",
    },
    opts = {},
    config = function()
      local wk = require("which-key")

      -- Testing
      wk.register({
        ["<leader>t"] = {
          name = "+test",
          a = { "<cmd>TestSuite<cr>", "Test all" },
          f = { "<cmd>TestFile<cr>", "Test file" },
          l = { "<cmd>TestLast<cr>", "Test last" },
          n = { "<cmd>TestNearest<cr>", "Test nearest" },
          v = { "<cmd>TestVisit<cr>", "Open latest" },
        },
      })

      -- Searching
      wk.register({
        ["<leader>f"] = {
          name = "+find",
          r = { "<cmd>Telescope resume<cr>", "resumo" },
          f = { "<cmd>Telescope find_files<cr>", "files" },
          e = { "<cmd>Telescope oldfiles<cr>", "recent" },
          b = { "<cmd>Telescope buffers<cr>", "buffers" },
          g = { "<cmd>Telescope git_files<cr>", "git files" },
          l = { "<cmd>Telescope live_grep<cr>", "live grep" },
          k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
          h = { "<cmd>Telescope search_history<cr>", "history" },
          c = { "<cmd>Telescope git_bcommits<cr>", "buf commits" },
          ["?"] = { "<cmd>Telescope help_tags<cr>", "help" },
        },
      })

      -- Coding
      wk.register({
        ["<leader>c"] = {
          name = "+coding",
          r = { "<cmd>lua require('refactoring').select_refactor()<CR>", "Select refactor" },
          z = { "<cmd>ZenMode<cr>", "Zen mode" },
          t = { "<cmd>Twilight<cr>", "Twilight" },
        },
      })

      -- Git
      local gitsigns = require("gitsigns")
      wk.register({
        ["<leader>g"] = {
          name = "+git",
          s = { "<cmd>Git<cr>", "Status" },
          b = { "<cmd>Git blame<cr>", "Blame" },
          -- l = { "<cmd>Git log %<cr>", "Buffer history" },
          ["lf"] = { "<cmd>DiffviewFileHistory %<cr>", "File history" },
          ["lo"] = { "<cmd>DiffviewFileHistory % --range=origin..HEAD<cr>", "File history (remote)" },
          p = { "<cmd>Git pull<cr>", "Pull changes" },
          P = { "<cmd>Git push<cr>", "Push changes" },
          I = { "<cmd>GitCoAuthors<cr>", "Co-authors" },
          D = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
          T = { gitsigns.toggle_linehl, "Toggle highlight" },
          S = { gitsigns.stage_hunk, "Stage hunk" },
          R = { gitsigns.reset_hunk, "Reset hunk" },
          X = { "<cmd>DiffviewClose<cr>", "Close diffview" },
        },
      })
      wk.register({
        ["<leader>g"] = {
          b = {
            ':<C-U>!git blame <C-R>=expand("%:p") <CR> | sed -n <C-R>=line("\'<") <CR>,<C-R>=line("\'>") <CR>p <CR>',
            "Blame",
          },
          ["lf"] = { "<cmd>DiffviewFileHistory<cr>", "Selection history" },
        },
      }, { mode = "v" })

      -- others
      wk.register({
        ["<leader>R"] = {
          name = "+rest",
          R = { "<Plug>RestNvim<CR>", "Run request" },
        },
      })
    end,
  },
}
