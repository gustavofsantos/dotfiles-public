local has_neotest, _ = pcall(require, "neotest")
if has_neotest then
  require("neotest").setup({
    adapters = {
      require('neotest-jest-loggi-beyond')({})
    },
    icons = {
      running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    },
  })
end
