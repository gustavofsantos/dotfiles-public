return {
  {
    "vim-test/vim-test",
    dependencies = {
      "christoomey/vim-tmux-runner",
    },
    config = function()
      vim.cmd([[let test#strategy = "vtr"]])
      vim.cmd([[let test#javascript#playwright#options = "--headed --retries 0 --workers 1"]])

      vim.cmd("autocmd VimEnter * lua local ok, err = pcall(vim.cmd, 'VtrAttachToPane 1')")

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", opts)
      vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", opts)
      vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<cr>", opts)
      vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", opts)
      vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<cr>", opts)
    end,
  },
}
