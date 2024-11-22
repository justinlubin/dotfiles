local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.window_padding = {
  left = 0,
  right = 0,
  top = 10,
  bottom = 0,
}

config.window_decorations = "RESIZE"

config.font = wezterm.font "Iosevka Term"
config.font_size = 19

config.color_scheme = "Ocean (base16)"
config.use_fancy_tab_bar = false

bg = "#2b303b"
fg = "#a7adba"

config.colors = {
  tab_bar = {
    background = bg,

    active_tab = {
      fg_color = fg,
      bg_color = bg,
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = fg,
      fg_color = bg,
    },

    inactive_tab_hover = {
      bg_color = fg,
      fg_color = bg,
    },

    new_tab = {
      fg_color = fg,
      bg_color = bg,
    },

    new_tab_hover = {
      fg_color = fg,
      bg_color = bg,
    },
  }
}

return config
