local utils = require("utils")

return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      "anuvyklack/hydra.nvim",
    },
    event = "BufRead",
    keys = {
      { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
      { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
    },
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

      utils.setup_hydra(Hydra, {
        name = "Git",
        mode = { "n", "x" },
        body = "<leader><Enter>",
        config = {
          color = "pink",
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
          { "s", gitsigns.stage_hunk, { silent = true, desc = "stage hunk" } },
          { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
          { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
          { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
          { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
          { "q", nil, { exit = true, nowait = true, desc = "exit" } },
        },
      })
    end,
  },

  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
      "2kabhishek/co-author.nvim",
    },
    config = function()
      local Hydra = require("hydra")

      utils.setup_hydra(Hydra, {
        name = "Git",
        body = "<leader>g",
        heads = {
          { "s", "<cmd>Git<cr>", { desc = "status", silent = true, exit = true } },
          { "p", "<cmd>Git pull<cr>", { desc = "pull changes", silent = true } },
          { "P", "<cmd>Git push<cr>", { desc = "push changes", silent = true } },
          { "b", "<cmd>Git blame<cr>", { desc = "blame", silent = true, exit = true } },
          { "I", "<cmd>GitCoAuthors<cr>", { desc = "co-authors", silent = true, exit = true } },
          { "l", "<cmd>Git log %<cr>", { silent = true, exit = true, desc = "history" } },
          { "q", nil, { exit = true, desc = "exit" } },
        },
      })
    end,
  },
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
