-- vim.g.mapleader = ""
if vim.loader then
  vim.loader.enable()
end
-- global.mapleader = " "

vim.g.mapleader = " "
require("config.lazy")
require("config.options")
if vim.g.neovide then
  require("config.neovide")
end
