local wezterm = require("wezterm")

local M = {}

M.setup = function()
    wezterm.on("update-right-status", function(window, pane)
        local Config = window:effective_config()

        local Overrides = window:get_config_overrides() or {}
        local theme = Config.color_schemes[Overrides.color_scheme or Config.color_scheme]

        local date = wezterm.strftime("%Y-%m-%d %H:%M")
        local workspace = window:active_workspace()

        window:set_right_status(wezterm.format({
            { Text = date .. " " },
            { Text = workspace },
        }))
    end)
end

return M
