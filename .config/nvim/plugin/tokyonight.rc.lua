local status, tokyonight = pcall(require, "tokyonight")
if (not status) then return end

tokyonight.setup {
  styles = {
    functions = { bold = true }
  },
  dim_inactive = true,
  lualine_bold = true
}
