local wezterm = require("wezterm")

return {
  -- color_scheme = "Poimandres", -- or "Poimandres Storm"
  -- color_scheme = "nightfox",
  color_scheme = "terafox", -- nightfox, dayfox, duskfox, nordfox, terafox

  -- font
  font = wezterm.font("MonoLisaCustom Nerd Font", { weight = "Regular" }),
  font_size = 11,
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

  leader = { key = "a", mods = "CTRL" },

  keys = {
    {
      key = "s",
      mods = "LEADER",
      action = wezterm.action {
        SplitHorizontal = { domain = "CurrentPaneDomain" }
      }
    },
    {
      key = "S",
      mods = "LEADER",
      action = wezterm.action {
        SplitVertical = { domain = "CurrentPaneDomain" }
      }
    },
    {
      key = "c",
      mods = "LEADER",
      action = wezterm.action {
        SpawnTab = "CurrentPaneDomain"
      }
    },
    {
      key = "1",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 0 }
    },
    {
      key = "2",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 1 }
    },
    {
      key = "3",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 2 }
    },
    {
      key = "4",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 3 }
    },
    {
      key = "5",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 4 }
    },
    {
      key = "6",
      mods = "LEADER",
      action = wezterm.action { ActivateTab = 5 }
    },
    {
      key = "Tab",
      mods = "LEADER",
      action = wezterm.action {
        ActivateTabRelative = 1
      }
    },
  }
}
