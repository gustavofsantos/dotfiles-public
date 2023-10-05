return {
  "windwp/nvim-projectconfig",
  event = "VeryLazy",
  opts = {
    project_config = {
      {
        path = ".+/targets/beyond", -- Loggi's Beyond UI project
        config = "~/.config/nvim/projects/beyond-ui.vim",
      },
      {
        path = ".+/apps/beyond",
        config = "~/.config/nvim/projects/beyond-py.vim",
      },
    },
  },
}
