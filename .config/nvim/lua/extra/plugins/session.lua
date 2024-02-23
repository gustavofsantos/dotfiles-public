return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        auto_session_use_git_branch = false,
        auto_session_enable_last_session = false,
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        pre_save_cmds = { "Neotree close" },
      })

      vim.keymap.set(
        "n",
        "<leader>Ss",
        require("auto-session.session-lens").search_session,
        { noremap = true, silent = true, desc = "Search session" }
      )
      vim.keymap.set(
        "n",
        "<leader>SS",
        require("auto-session.session-lens").search_session,
        { noremap = true, silent = true, desc = "Search session" }
      )
    end,
  },
}
