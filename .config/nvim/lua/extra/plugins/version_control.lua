return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
      "lewis6991/gitsigns.nvim",
      "2kabhishek/co-author.nvim",
      "folke/which-key.nvim",
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
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
          add = { text = "▌" },
          change = { text = "▌" },
          delete = { text = "▌" },
          topdelete = { text = "▌" },
          changedelete = { text = "▌" },
          untracked = { text = "░" },
        },
      })

      local wk = require("which-key")
      wk.register({
        g = {
          name = "Git",
          s = { "<cmd>Git<cr>", "Git status" },
          b = { "<cmd>Git blame<cr>", "Git blame" },
          c = { "<cmd>Git commit<cr>", "Git commit" },
          d = { "<cmd>Git diff<cr>", "Git diff" },
          D = { "<cmd>Git diff --cached<cr>", "Git diff staged" },
          l = { "<cmd>Git log<cr>", "Git log" },
          p = { "<cmd>Git push<cr>", "Git push" },
          P = { "<cmd>Git pull<cr>", "Git pull" },
          r = { "<cmd>Git reset<cr>", "Git reset" },
          R = { "<cmd>Git restore<cr>", "Git restore" },
          H = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
          I = { "<cmd>GitCoAuthors<cr>", "Insert co-author" },
        },
        h = {
          name = "Hunk",
          s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
          r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
          p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
        },
      }, {
        prefix = "<leader>",
      })

      wk.register({
        ["]h"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
        ["[h"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
        ["gH"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
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

      local wk = require("which-key")
      wk.register({
        ["<leader>G"] = { name = "+github" },
        ["<leader>GH"] = { "<cmd>GhActions<cr>", "GitHub Actions" },
      })
    end,
  },
}
