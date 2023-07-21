local has_obsidian, _  = pcall(require, "obsidian")
if has_obsidian then
  require('obsidian').setup({
    dir = "~/notes",
    daily_notes = {
      folder = "journal",
      date_format = "%Y-%m-%d"
    },
    completion = {
      nvim_cmp = false,
    },
    follow_url_func = function(url)
      vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
  })
end
