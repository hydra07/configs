if vim.loader then
	vim.loader.enable()
end
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.options")
require("config.lazy")
if vim.g.neovide then
	require("config.neovide")
end

