return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      "lewis6991/gitsigns.nvim",
      "anuvyklack/hydra.nvim",
    },
    event = "BufRead",
    config = function()
      local gitsigns = require("gitsigns")
      local Hydra = require("hydra")

      gitsigns.setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
        signs = {
          add = { text = "▌" },
          change = { text = "▌" },
          delete = { text = "▌" },
          topdelete = { text = "▌" },
          changedelete = { text = "▌" },
          untracked = { text = "░" },
        },
      })

      local hint = [[
_J_: next hunk    _K_: prev hunk    _l_: file history _x_: close dv
_s_: stage hunk   _u_: undo stage   _S_: state buf    _p_: preview hunk
_d_: deleted      _b_: blame        _/_: base file
^
_<Enter>_: status _q_: quit
]]

      Hydra({
        name = "Git",
        hint = hint,
        mode = { "n", "x" },
        body = "<leader>g",
        config = {
          color = "pink",
          invoke_on_body = true,
          hint = {
            border = "rounded",
          },
          on_key = function()
            vim.wait(50)
          end,
          on_enter = function()
            vim.cmd("mkview")
            vim.cmd("silent! %foldopen!")
            gitsigns.toggle_linehl(true)
          end,
          on_exit = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd("loadview")
            vim.api.nvim_win_set_cursor(0, cursor_pos)
            vim.cmd("normal zv")
            gitsigns.toggle_linehl(false)
            gitsigns.toggle_deleted(false)
          end,
        },
        heads = {
          {
            "J",
            function()
              if vim.wo.diff then
                return "]c"
              end
              vim.schedule(function()
                gitsigns.next_hunk()
              end)
              return "<Ignore>"
            end,
            { expr = true, desc = "next hunk" },
          },
          {
            "K",
            function()
              if vim.wo.diff then
                return "[c"
              end
              vim.schedule(function()
                gitsigns.prev_hunk()
              end)
              return "<Ignore>"
            end,
            { expr = true, desc = "prev hunk" },
          },
          { "l", ":DiffviewFileHistory %<cr>", { silent = true, exit = true, desc = "history" } },
          { "x", ":DiffviewClose<cr>", { silent = true, exit = true, desc = "close diffview" } },
          { "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
          { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
          { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
          { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
          { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
          { "b", "<cmd>Git blame<cr>", { desc = "Show blame" } },
          { "/", gitsigns.show, { exit = true, desc = "show base file" } }, -- show the base of the file
          {
            "<Enter>",
            "<cmd>Git<CR>",
            -- function()
            --   lazygit:toggle()
            -- end,
            { silent = true, nowait = true, exit = true, desc = "Lazygit" },
          },
          { "q", nil, { exit = true, nowait = true, desc = "exit" } },
        },
      })
    end,
  },
  -- {
  --   "tpope/vim-fugitive",
  --   dependencies = {
  --     "tpope/vim-rhubarb",
  --     "2kabhishek/co-author.nvim",
  --     "folke/which-key.nvim",
  --     "stevearc/dressing.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   event = "BufRead",
  --   enabled = false,
  --   config = function()
  --     local gitsigns = require("gitsigns")
  --
  --     gitsigns.setup({
  --       signcolumn = true,
  --       numhl = false,
  --       linehl = false,
  --       attach_to_untracked = false,
  --       current_line_blame = false,
  --       current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
  --       signs = {
  --         add = { text = "▌" },
  --         change = { text = "▌" },
  --         delete = { text = "▌" },
  --         topdelete = { text = "▌" },
  --         changedelete = { text = "▌" },
  --         untracked = { text = "░" },
  --       },
  --     })
  --
  --     local wk = require("which-key")
  --     wk.register({
  --       g = {
  --         name = "Git",
  --         s = { "<cmd>Git<cr>", "Git status" },
  --         b = { "<cmd>Git blame<cr>", "Git blame" },
  --         B = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "Checkout branch" },
  --         c = { "<cmd>Git commit<cr>", "Git commit" },
  --         d = { "<cmd>Git diff<cr>", "Git diff" },
  --         D = { "<cmd>Git diff --cached<cr>", "Git diff staged" },
  --         l = { "<cmd>Git log<cr>", "Git log" },
  --         p = { "<cmd>Git push<cr>", "Git push" },
  --         P = { "<cmd>Git pull<cr>", "Git pull" },
  --         r = { "<cmd>Git reset<cr>", "Git reset" },
  --         R = { "<cmd>Git restore<cr>", "Git restore" },
  --         H = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
  --         I = { "<cmd>GitCoAuthors<cr>", "Insert co-author" },
  --       },
  --       h = {
  --         name = "Hunk",
  --         s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
  --         r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
  --         p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
  --       },
  --     }, {
  --       prefix = "<leader>",
  --     })
  --
  --     wk.register({
  --       ["]h"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
  --       ["[h"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
  --       ["gH"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
  --     })
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
            winbar_info = true,
          },
        },
        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          view = {
            { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel." } },
            {
              "n",
              "g<C-x>",
              actions.cycle_layout,
              { desc = "Cycle through available layouts." },
            },
            {
              "n",
              "[x",
              actions.prev_conflict,
              { desc = "In the merge-tool: jump to the previous conflict" },
            },
            {
              "n",
              "]x",
              actions.next_conflict,
              { desc = "In the merge-tool: jump to the next conflict" },
            },
            {
              "n",
              "<leader>co",
              actions.conflict_choose("ours"),
              { desc = "Choose the OURS version of a conflict" },
            },
            {
              "n",
              "<leader>ct",
              actions.conflict_choose("theirs"),
              { desc = "Choose the THEIRS version of a conflict" },
            },
            {
              "n",
              "<leader>cb",
              actions.conflict_choose("base"),
              { desc = "Choose the BASE version of a conflict" },
            },
            {
              "n",
              "<leader>ca",
              actions.conflict_choose("all"),
              { desc = "Choose all the versions of a conflict" },
            },
            { "n", "dx", actions.conflict_choose("none"), { desc = "Delete the conflict region" } },
            {
              "n",
              "<leader>cO",
              actions.conflict_choose_all("ours"),
              { desc = "Choose the OURS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cT",
              actions.conflict_choose_all("theirs"),
              { desc = "Choose the THEIRS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cB",
              actions.conflict_choose_all("base"),
              { desc = "Choose the BASE version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cA",
              actions.conflict_choose_all("all"),
              { desc = "Choose all the versions of a conflict for the whole file" },
            },
            {
              "n",
              "dX",
              actions.conflict_choose_all("none"),
              { desc = "Delete the conflict region for the whole file" },
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    },
  },
  {
    "topaxi/gh-actions.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "pwntester/octo.nvim" },
    config = function()
      require("gh-actions").setup()

      -- local wk = require("which-key")
      -- wk.register({
      --   ["<leader>G"] = { name = "+github" },
      --   ["<leader>GH"] = { "<cmd>GhActions<cr>", "GitHub Actions" },
      -- })
    end,
  },
}
