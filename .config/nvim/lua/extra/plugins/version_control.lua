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
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "│" },
          topdelete = { text = "│" },
          changedelete = { text = "│" },
          untracked = { text = "┆" },
        },
      })
    end,
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
      { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
      { "gH", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
      { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
      { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
      { "dgu", "<cmd>diffget //2<cr>", desc = "Diff get from upstream" },
      { "dgl", "<cmd>diffget //3<cr>", desc = "Diff get from local" },
    },
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
    "2kabhishek/co-author.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "GitCoAuthors",
  },
  {
    "topaxi/gh-actions.nvim",
    cmd = "GhActions",
    keys = {
      { "<leader>gh", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {},
    config = function(_, opts)
      require("gh-actions").setup(opts)
    end,
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
