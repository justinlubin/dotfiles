local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- config.initial_rows = 12
config.initial_cols = 80

-- config.window_decorations = "RESIZE"

config.font = wezterm.font "Iosevka Term"
config.font_size = 21

config.color_scheme = "Ocean (base16)"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

bg = "#2b303b" -- base00
mid = "#65737e" -- base03
fg =  "#eff1f5" -- base07

config.colors = {
  tab_bar = {
    background = mid,

    active_tab = {
      bg_color = bg,
      fg_color = mid,
      intensity = "Bold",
      italic = true,
    },

    inactive_tab = {
      bg_color = mid,
      fg_color = bg,
    },

    inactive_tab_hover = {
      bg_color = mid,
      fg_color = bg,
    },

    new_tab = {
      bg_color = mid,
      fg_color = bg,
    },

    new_tab_hover = {
      bg_color = mid,
      fg_color = bg,
    },
  }
}

return config
