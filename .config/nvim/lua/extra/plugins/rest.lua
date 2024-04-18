return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "luarocks.nvim" },
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
}
