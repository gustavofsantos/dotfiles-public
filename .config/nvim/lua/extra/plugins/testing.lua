return {
  {
    "vim-test/vim-test",
    config = function()
      vim.cmd([[let test#strategy = "toggleterm"]])
      vim.cmd([[let test#javascript#playwright#options = "--headed --retries 0 --workers 1"]])
    end,
  },
}
