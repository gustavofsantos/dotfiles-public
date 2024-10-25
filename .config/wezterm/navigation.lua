local utils = require("utils")
local wezterm = require("wezterm")

local M = {}

local act = wezterm.action

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if utils.is_vi_process(pane) then
        window:perform_action(
        -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

M.setup = function()
    wezterm.on('ActivatePaneDirection-right', function(window, pane)
        conditionalActivatePane(window, pane, 'Right', 'l')
    end)
    wezterm.on('ActivatePaneDirection-left', function(window, pane)
        conditionalActivatePane(window, pane, 'Left', 'h')
    end)
    wezterm.on('ActivatePaneDirection-up', function(window, pane)
        conditionalActivatePane(window, pane, 'Up', 'k')
    end)
    wezterm.on('ActivatePaneDirection-down', function(window, pane)
        conditionalActivatePane(window, pane, 'Down', 'j')
    end)
end

return M
