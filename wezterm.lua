local wezterm = require('wezterm')

local config = wezterm.config_builder()

local function load_local_config()
    local local_config_path = wezterm.config_dir .. '/local/init.lua'
    local local_config, err = loadfile(local_config_path)
    if local_config then
        return local_config()
    else
        wezterm.log_info("No local configuration was found, or there was an error loading it: " .. (err or "unknown error"))
        return {}
    end
end

-- colorscheme and font
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
        args = {'powershell.exe', '-NoLogo' },
    })
end

config.launch_menu = launch_menu


local local_config = load_local_config()
for k, v in pairs(local_config) do
    config[k] = v
end

return config
