local wezterm = require("wezterm")
local sessionizer = require("sessionizer")
local act = wezterm.action

local M = {}

M.setup = function(config)
    config.leader = { key = "a", mods = "CTRL" }
    config.keys = {
        {
            key = "s",
            mods = "LEADER",
            action = wezterm.action({
                SplitHorizontal = { domain = "CurrentPaneDomain" },
            }),
        },
        {
            key = "S",
            mods = "LEADER",
            action = wezterm.action({
                SplitVertical = { domain = "CurrentPaneDomain" },
            }),
        },
        {
            key = "c",
            mods = "LEADER",
            action = wezterm.action({
                SpawnTab = "CurrentPaneDomain",
            }),
        },
        { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
        { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
        { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
        { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
        {
            key = "h",
            mods = "LEADER",
            action = wezterm.action({
                ActivatePaneDirection = "Left",
            }),
        },
        {
            key = "j",
            mods = "LEADER",
            action = wezterm.action({
                ActivatePaneDirection = "Down",
            }),
        },
        {
            key = "k",
            mods = "LEADER",
            action = wezterm.action({
                ActivatePaneDirection = "Up",
            }),
        },
        {
            key = "l",
            mods = "LEADER",
            action = wezterm.action({
                ActivatePaneDirection = "Right",
            }),
        },
        {
            key = "1",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 0 }),
        },
        {
            key = "2",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 1 }),
        },
        {
            key = "3",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 2 }),
        },
        {
            key = "4",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 3 }),
        },
        {
            key = "5",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 4 }),
        },
        {
            key = "6",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 5 }),
        },
        {
            key = "7",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 6 }),
        },
        {
            key = "8",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 7 }),
        },
        {
            key = "9",
            mods = "LEADER",
            action = wezterm.action({ ActivateTab = 8 }),
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
            key = "o",
            mods = "LEADER",
            action = wezterm.action_callback(sessionizer.toggle),
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
        },
        {
            key = 'l',
            mods = 'LEADER',
            action = wezterm.action.ShowLauncherArgs {
                flags = 'FUZZY|WORKSPACES',
            },
        },
        {
            key = ",",
            mods = "LEADER",
            action = wezterm.action.PromptInputLine({
                description = "Enter new name for tab",
                action = wezterm.action_callback(function(window, pane, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            }),
        },
    }
end


return M
