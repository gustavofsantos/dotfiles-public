if vim.o.background ~= "dark" then
  return
end

vim.cmd("highlight clear")
vim.g.colors_name = "subliminal"

local colors = {
  bg = "#282b35",
  bg_lighter = "#2f323d",
  bg_darker = "#222730",
  fg = "#cccccc",

  black = "#7f7f7f",
  red = "#e15a60",
  green = "#99c794",
  yellow = "#ffe2a9",
  blue = "#6699cc",
  magenta = "#c594c5",
  cyan = "#5fb3b3",
  white = "#d4d4d4",

  bright_black = "#7f7f7f",
  bright_red = "#e15a60",
  bright_green = "#99c794",
  bright_yellow = "#ffe2a9",
  bright_blue = "#6699cc",
  bright_magenta = "#c594c5",
  bright_cyan = "#5fb3b3",
  bright_white = "#d4d4d4",

  float_bg = colors.bg_darker,

  none = "NONE",
}
