return {
  "vim-test/vim-test",
  enabled = true,
  dependencies = {
    "christoomey/vim-tmux-runner",
  },
  config = function()
    vim.cmd([[let test#strategy = "vtr"]])
    vim.cmd([[let test#javascript#playwright#options = "--headed --retries 0 --workers 1"]])
  end,
  keys = {
    {
      "<leader>ta",
      "<cmd>TestSuite<cr>",
      mode = "n",
      desc = "Test all",
    },
    {
      "<leader>tf",
      "<cmd>TestFile<cr>",
      mode = "n",
      desc = "Test file",
    },
    {
      "<leader>tl",
      "<cmd>TestLast<cr>",
      mode = "n",
      desc = "Test last",
    },
    {
      "<leader>tn",
      "<cmd>TestNearest<cr>",
      mode = "n",
      desc = "Test nearest",
    },
    {
      "<leader>tv",
      "<cmd>TestVisit<cr>",
      mode = "n",
      desc = "Open latest",
    },
  },
}
