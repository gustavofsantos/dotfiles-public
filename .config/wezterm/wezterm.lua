local wezterm = require("wezterm")

return {
    force_reverse_video_cursor = true,
    color_scheme = "Kanagawa",

    font = wezterm.font("MonoLisa Nerd Font"),
    -- font_size = 10.0,
    font_size = 14.6,
    freetype_load_flags = "NO_HINTING",
    freetype_load_target = "Normal",
    front_end = "OpenGL",
    line_height = 1.0,

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
