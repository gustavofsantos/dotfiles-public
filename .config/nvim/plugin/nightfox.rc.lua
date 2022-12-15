local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup {
  options = {
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "italic",
      functions = "italic",
      constants = "bold"
    }
  }
}
