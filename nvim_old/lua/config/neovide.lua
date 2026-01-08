local global = vim.g
local alpha = function()
  return string.format("%x", math.floor((255 * global.transparency) or 0.8))
end

global.neovide_theme = "auto"
global.neovide_transparency = 0.9
global.transparency = 0.8
global.neovide_background_color = "#0f1117" .. alpha()
global.neovide_remember_window_size = true

-- vim.o.guifont = "ComicShannsMono Nerd Font:h15"
global.neovide_cursor_vfx_mode = "sonicboom"
-- fps
global.neovide_refresh_rate = 60
