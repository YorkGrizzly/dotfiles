-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Dark+"
wezterm.font("JetBrainsMono Nerd Font Propo", { weight = "Regular", stretch = "Normal", style = "Normal" })
wezterm.font_size = 13.0
config.window_background_opacity = 0.75
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
