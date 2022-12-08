local wezterm = require("wezterm")

return {
  color_scheme = "Poimandres", -- or "Poimandres Storm"

  -- font
  font = wezterm.font("MonoLisaCustom Nerd Font", { weight = "Regular" }),
  font_size = 12,
  -- line_height = 1.7,

  window_background_opacity = 0.98,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 999999,
}
