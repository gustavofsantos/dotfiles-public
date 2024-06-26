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

      -- Editor
      wk.register({
        ["<leader>e"] = {
          name = "+editor",
          s = { "<cmd>vsplit<cr>", "Split window" },
          S = { "<cmd>split<cr>", "Split window horizontally" },
          n = {
            function()
              local is_showing_line_numbers = vim.wo.number
              if is_showing_line_numbers then
                vim.o.number = false
                vim.o.relativenumber = false
              else
                vim.o.number = true
                vim.o.relativenumber = true
              end
            end,
            "Toggle line numbers",
          },
          c = {
            function()
              local is_showing_signcol = vim.wo.signcolumn == "yes"
              if is_showing_signcol then
                vim.o.signcolumn = "no"
              else
                vim.o.signcolumn = "yes"
              end
            end,
            "Toggle sign column",
          },
        },
      })
      wk.register({
        ["<leader>q"] = {
          name = "+close/quickfix",
          q = { "<cmd>q<cr>", "Close buffer" },
          x = { "<cmd>cclose<cr>", "Close quickfix list" },
          o = { "<cmd>copen<cr>", "Open quickfix list" },
        },
      })
      wk.register({
        ["<c-w>"] = {
          name = "+window",
          s = { "<cmd>vsplit<cr>", "Split window" },
          S = { "<cmd>split<cr>", "Split window horizontally" },
          ["<c-s>"] = { "<cmd>vsplit<cr>", "Split window" },
        },
      })

      -- Jumping
      wk.register({
        ["]"] = {
          name = "+next",
          h = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
          q = { "<cmd>cnext<cr>", "Quickfix next" },
          l = { "<cmd>lnext<cr>", "Location list next" },
        },
      })
      wk.register({
        ["["] = {
          name = "+prev",
          h = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
          q = { "<cmd>cprevious<cr>", "Quickfix previous" },
          l = { "<cmd>lprevious<cr>", "Location list previous" },
        },
      })

      -- Testing
      wk.register({
        ["<leader>t"] = {
          name = "+test",
        },
      })

      -- Problems
      wk.register({
        ["<leader>x"] = {
          name = "+problems",
        },
      })

      -- Searching
      wk.register({
        ["<leader>f"] = {
          name = "+find",
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
      wk.register({
        ["<leader>g"] = {
          name = "+git",
          s = { "<cmd>Git<cr>", "Status" },
          w = { "<cmd>Telescope git_worktree<cr>", "Worktree" },
          c = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
          p = { "<cmd>Git pull<cr>", "Pull changes" },
          P = { "<cmd>Git push<cr>", "Push changes" },
          I = { "<cmd>GitCoAuthors<cr>", "Co-authors" },
        },
      })
      wk.register({
        ["<leader>gb"] = {
          name = "+buffer",
          b = { "<cmd>Git blame<cr>", "Blame" },
          r = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
          l = { "<cmd>DiffviewFileHistory %<cr>", "File history" },
          L = { "<cmd>DiffviewFileHistory % --range=origin..HEAD<cr>", "File history (origin)" },
        },
      })
      wk.register({
        ["<leader>gb"] = {
          name = "+buffer",
          b = {
            ':<C-U>!git blame <C-R>=expand("%:p") <CR> | sed -n <C-R>=line("\'<") <CR>,<C-R>=line("\'>") <CR>p <CR>',
            "Blame",
          },
          l = { "<cmd>DiffviewFileHistory<cr>", "File history" },
        },
      }, { mode = "v" })
      wk.register({
        ["<leader>gh"] = {
          name = "+hunk",
          t = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle line highlight" },
          p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
          s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
          r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
        },
      })
      wk.register({
        ["<leader>gd"] = {
          name = "+diff",
          o = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
          c = { "<cmd>DiffviewClose<cr>", "Close diffview" },
        },
      })

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
