return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    priority = 1,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")

      -- Testing
      wk.register({
        ["<leader>t"] = {
          name = "+test",
        },
      })

      -- Searching
      wk.register({
        ["<leader>f"] = {
          name = "+find",
          a = { require("harpoon.mark").add_file, "mark file" },
          m = { require("harpoon.ui").toggle_quick_menu, "marks" },
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
          p = { "<cmd>Git pull<cr>", "Pull changes" },
          P = { "<cmd>Git push<cr>", "Push changes" },
          I = { "<cmd>GitCoAuthors<cr>", "Co-authors" },
          D = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
          T = { gitsigns.toggle_linehl, "Toggle highlight" },
          X = { "<cmd>DiffviewClose<cr>", "Close diffview" },
        },
      })
      wk.register({
        ["<leader>gb"] = {
          name = "+buffer",
          b = { "<cmd>Git blame<cr>", "Blame" },
          l = { "<cmd>DiffviewFileHistory %<cr>", "Log" },
          o = { "<cmd>DiffviewFileHistory % --range=origin..HEAD<cr>", "Log (remote)" },
          r = { gitsigns.reset_buffer, "Reset buffer" },
        },
      })
      wk.register({
        ["<leader>gw"] = {
          name = "+worktree",
          c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create worktree" },
          l = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "List worktrees" },
        },
      })
      wk.register({
        ["<leader>gh"] = {
          name = "+hunk",
          s = { gitsigns.stage_hunk, "Stage hunk" },
          r = { gitsigns.reset_hunk, "Reset hunk" },
          p = { gitsigns.preview_hunk, "Preview hunk" },
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
