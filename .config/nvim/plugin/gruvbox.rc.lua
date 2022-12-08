local status, gruvbox = pcall(require, "gruvbox")
if (not status) then return end

gruvbox.setup({
  contrast = "hard",
  dim_inactive = true,
})
