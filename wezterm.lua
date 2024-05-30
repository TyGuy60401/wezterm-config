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


-- window size/padding
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 5,
}

-- backround image
config.window_background_image = "C:/Users/USYEW/.config/wezterm/imgs/Trish-and-Ty-053.jpg"

config.window_background_image_hsb = {
    brightness = 0.12,
    hue = 1.0,
    saturation = 0.6,
}
config.text_background_opacity = 0.5



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
