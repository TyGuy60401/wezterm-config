local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- colorscheme and font
config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.font = wezterm.font("CaskaydiaMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 10.5


-- window size/padding
config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 5,
}

-- backround image
-- config.window_background_image = "C:/Users/USYEW/.config/wezterm/imgs/Trish-and-Ty-053.jpg"

config.window_background_image_hsb = {
    brightness = 0.1,
    hue = 1.0,
    saturation = 1.0,
}
config.text_background_opacity = 0.95



local launch_menu = {}

-- powershell if on windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'powershell.exe'}
    table.insert(launch_menu, {
        label = 'Powershell',
        args = {'powershell.exe', '-No7ogo' },
    })
end

config.launch_menu = launch_menu

return config
