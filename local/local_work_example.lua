-- local config

local wezterm = require('wezterm')
local state_manager = require('state_manager')

local config = wezterm.config_builder()
local state_file = "C:/Users/USYEW/.config/wezterm/local/state.json"


config.font = wezterm.font_with_fallback({"CaskaydiaCove Nerd Font Mono"})
config.font_size = 10.5

config.color_scheme = 'Vs Code Dark+ (Gogh)'


local state = state_manager.read_state(state_file)
if state.use_background_image then
    config.window_background_image = 'C:/Users/USYEW/.config/wezterm/imgs/cycle/plane' .. math.random(10) .. '.png'
    config.window_background_image_hsb = {
        brightness = 0.12,
        hue = 1.0,
        saturation = 0.6,
    }
else
    config.window_background_image = nil
end
config.text_background_opacity = 0.5

config.command_palette_font_size = 10.5

config.window_frame = {
    font = wezterm.font_with_fallback({family="CaskaydiaCove Nerd Font Mono"}),
    font_size = 9,
}

config.default_cwd = "C:/Users/USYEW/OneDrive - Barnes Group Inc/RandomLocal/"

return config
