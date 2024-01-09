-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'nord'
config.font = wezterm.font('IosevkaTerm Nerd Font')
config.font_size = 12
config.line_height = 1.2

config.ssh_domains = {
    {
        name = "v2",
        remote_address = "v2",
    },
    {
        name = "gce",
        remote_address = "gce",
    }
}

config.keys = {
    {key="b", mods="CMD", action=wezterm.action{SendString="\x1bb"}},
    {key="f", mods="CMD", action=wezterm.action{SendString="\x1bf"}},
    {key="d", mods="CMD", action=wezterm.action{SendString="\x1bd"}},
}

config.default_prog = { '/opt/homebrew/bin/nu', '-l' }
config.mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left" }},
        mods = "NONE",
        action = wezterm.action.CompleteSelection "Clipboard",
    },

    -- and make CTRL-Click open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}


-- and finally, return the configuration to wezterm
return config

