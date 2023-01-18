local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- return "Catppuccin Mocha"
    return "Kanagawa"
  else
    return "Catppuccin Latte"
  end
end

return {
  -- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  force_reverse_video_cursor = true,
  colors = {
    foreground = "#dcd7ba",
    background = "#1f1f28",

    cursor_bg = "#c8c093",
    cursor_fg = "#c8c093",
    cursor_border = "#c8c093",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    scrollbar_thumb = "#16161d",
    split = "#16161d",

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  },

  -- font
  font = wezterm.font("MonoLisaCustom Nerd Font", { weight = "Regular" }),
  font_size = 11,

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
      key = "h",
      mods = "LEADER",
      action = wezterm.action {
        ActivatePaneDirection = "Left"
      }
    },
    {
      key = "j",
      mods = "LEADER",
      action = wezterm.action {
        ActivatePaneDirection = "Down"
      }
    },
    {
      key = "k",
      mods = "LEADER",
      action = wezterm.action {
        ActivatePaneDirection = "Up"
      }
    },
    {
      key = "l",
      mods = "LEADER",
      action = wezterm.action {
        ActivatePaneDirection = "Right"
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
