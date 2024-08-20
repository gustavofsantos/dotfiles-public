local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
    local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")

    window:set_right_status(wezterm.format({
        { Text = date },
    }))
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while number_value > 0 do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

local config = {}


config.automatically_reload_config = false
config.force_reverse_video_cursor = true
config.color_scheme = "Kanagawa"

config.font = wezterm.font("MonoLisa Nerd Font")
config.font_size = 11
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Normal"
config.line_height = 1.2
config.harfbuzz_features = { "clig=1", "liga=1" }
config.bold_brightens_ansi_colors = false
config.warn_about_missing_glyphs = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 999999

for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
    if gpu.backend == "Vulkan" and (gpu.device_type == "IntegratedGpu" or gpu.device_type == "DiscreteGpu") then
        config.webgpu_preferred_adapter = gpu
        config.front_end = "WebGpu"
    end
end

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
        action = wezterm.action.RotatePanes("Clockwise"),
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

return config
