-- local config

local wezterm = require('wezterm')
local config = wezterm.config_builder()


config.font = wezterm.font_with_fallback({"CaskaydiaCove Nerd Font Mono"})
config.font_size = 10.5

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.window_background_image = 'C:/Users/USYEW/.config/wezterm/imgs/cycle/plane' .. math.random(8) .. '.png'
config.window_background_image_hsb = {
    brightness = 0.12,
    hue = 1.0,
    saturation = 0.6,
}
config.text_background_opacity = 0.5

config.command_palette_font_size = 10.5

config.window_frame = {
    font = wezterm.font_with_fallback({"CaskaydiaCove Nerd Font Mono"}),
    font_size = 9,
}

return config
