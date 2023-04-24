local wezterm = require("wezterm")

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "arctic"
  else
    return "ModusOperandi"
  end
end

wezterm.on('update-right-status', function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime '%b %-d %H:%M '

  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = '󱐋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  window:set_right_status(wezterm.format {
    { Text = date .. ' | ' .. bat },
    { Foreground = { Color = "#d4d4d4" } },
  })
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane_title = tab.active_pane.title
  local tab_title = tab.tab_title
  local index = tonumber(tab.tab_index) + 1
  local is_zoomed = tab.active_pane.is_zoomed
  local format = {}

  if is_zoomed then
    table.insert(format, { Text = ' ' .. index .. ': Z ' .. (tab_title and tab_title or pane_title) .. ' ' })
  else
    table.insert(format, { Text = ' ' .. index .. ': ' .. (tab_title and tab_title or pane_title) .. ' ' })
  end
  return format
end)

return {
  force_reverse_video_cursor = true,
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),

  -- font
  font = wezterm.font("MonoLisa Nerd Font", { weight = "Medium" }),
  font_size = 12,

  window_background_opacity = 0.975,

  line_height = 1.2,

  window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
  },

  -- tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = false,
  tab_max_width = 999999,

  leader = { key = "k", mods = "CTRL" },

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
      action = wezterm.action { ActivateTabRelative = 1 }
    },
    {
      key = "w",
      mods = "LEADER",
      action = wezterm.action.ShowTabNavigator,
    },
    {
      key = "e",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine {
        description = "New tab name",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end)
      }
    },
    {
      key = "n",
      mods = "LEADER",
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = "z",
      mods = "LEADER",
      action = wezterm.action.TogglePaneZoomState,
    }
  }
}
