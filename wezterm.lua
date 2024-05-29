local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- colorscheme and font
config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.font = wezterm.font("CaskaydiaMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 10.5


config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 5,
}



-- default terminal program
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'}
end


return config
