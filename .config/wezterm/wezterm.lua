local config = {}

local wezterm = require("wezterm")
require("navigation").setup()
require("keymapping").setup(config)
require("statusline").setup()


config.automatically_reload_config = false
config.force_reverse_video_cursor = true
config.color_scheme = "Kanagawa"

-- config.font = wezterm.font("MonoLisa Nerd Font")
config.font = wezterm.font("BerkeleyMono Nerd Font")
config.font_size = 12
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Normal"
config.line_height = 1.35
config.harfbuzz_features = { "clig=1", "liga=1" }
config.bold_brightens_ansi_colors = false
config.warn_about_missing_glyphs = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98
config.window_close_confirmation = "NeverPrompt"

-- config.window_padding = {
--     left = 16,
--     right = 16,
--     top = 16,
--     bottom = 16,
-- }

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
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

return config
