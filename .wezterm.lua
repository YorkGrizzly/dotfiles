-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Dark+"
wezterm.font("JetBrainsMono Nerd Font Propo", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.window_background_opacity = 0.75

-- and finally, return the configuration to wezterm
return config
