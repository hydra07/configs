local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- vim.o.termguicolors    = true
opt.number = true
opt.title = true
opt.tabstop = 2
opt.showtabline = 2
opt.relativenumber = true
opt.numberwidth = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.termguicolors = true
local sysname = vim.loop.os_uname().sysname

if sysname == "Windows_NT" then
	require("config.window")
elseif sysname == "Darwin" then
	require("config.macos")
else
	require("config.linux")
end
