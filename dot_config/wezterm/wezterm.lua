local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = "Catppuccin Mocha"

-- config.disable_default_key_bindings = true

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE | RESIZE"
config.colors = {
	foreground = "#ffffff",
	background = "#0a0a0a",

	ansi = {
		"#000000", -- black
		"#b00000", -- red
		"#00b000", -- green
		"#a05a00", -- yellow/brown
		"#0000b0", -- blue
		"#b000b0", -- magenta
		"#00b0b0", -- cyan
		"#b0b0b0", -- white (light gray)
	},
	brights = {
		"#505050", -- bright black
		"#ff7070", -- bright red
		"#70ff70", -- bright green
		"#ffff70", -- bright yellow
		"#7070ff", -- bright blue
		"#ff70ff", -- bright magenta
		"#70ffff", -- bright cyan
		"#ffffff", -- bright white
	},
}
config.window_background_opacity = 0.8

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.scrollback_lines = 10000

config.enable_tab_bar = false

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 11

config.cursor_blink_rate = 0

return config
