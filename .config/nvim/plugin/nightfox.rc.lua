local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup {
  options = {
    dim_inactive = true,
    transparent = false,
    styles = {
      comments = "italic",
      functions = "italic",
      -- conditionals = "italic",
      constants = "italic,bold",
      variables = "italic",
      numbers = "bold",
      types = "italic"
    }
  }
}
