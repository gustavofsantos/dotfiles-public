return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      skip_confirm_for_simple_edits = true,
    })

    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open oil" })
  end,
}
