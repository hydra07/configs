local global = vim.g
vim.o.guifont = "Maple Mono NF:h13"
global.neovide_opacity = 0.9
local alpha = function()
	return string.format("%x", math.floor(255 * (global.neovide_transparency or 0.9)))
end
global.neovide_background_color = "#0f1117" .. alpha()
global.neovide_refresh_rate = 0
global.neovide_no_idle = true -- Luôn mượt, không bị khựng khi không gõ
global.neovide_remember_window_size = true
global.neovide_confirm_quit = true -- Tránh lỡ tay đóng cửa sổ
global.neovide_cursor_vfx_mode = "sonicboom"
global.neovide_cursor_animation_length = 0.08 -- Giảm nhẹ để cảm giác gõ nhanh hơn
global.neovide_cursor_trail_size = 0.5
global.neovide_theme = "auto"
global.neovide_input_use_logo = true
