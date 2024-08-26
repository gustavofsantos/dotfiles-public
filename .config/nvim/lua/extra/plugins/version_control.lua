return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "BufRead",
    keys = {
      { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
      { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
    },
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "▎" },
          topdelete = { text = "▎" },
          changedelete = { text = "▎" },
          untracked = { text = "░" },
        },
        signs_staged = {
          add          = { text = '░' },
          change       = { text = '░' },
          delete       = { text = '░' },
          topdelete    = { text = '░' },
          changedelete = { text = '░' },
          untracked    = { text = '░' },
        },
      })

      vim.keymap.set("n", "<leader>ght", "<cmd>Gitsigns toggle_linehl<cr>",
        { noremap = true, silent = true, desc = "toggle line highlight" })
      vim.keymap.set("n", "<leader>ght", "<cmd>Gitsigns toggle_linehl<cr>",
        { noremap = true, silent = true, desc = "Toggle line highlight" })
      vim.keymap.set("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>",
        { silent = true, noremap = true, desc = "Preview hunk" })
      vim.keymap.set("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>",
        { silent = true, noremap = true, desc = "Stage hunk" })
      vim.keymap.set("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>",
        { noremap = true, silent = true, desc = "Reset hunk" })
    end,
  },
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
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
            { "n", "<leader>e", actions.focus_files,  { desc = "Bring focus to the file panel" } },
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
  },
}
