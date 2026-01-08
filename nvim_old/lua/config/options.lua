-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local global = vim.g

-- global.maplocalleader = " "

local o = vim.o
o.shell = "pwsh"
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
-- o.splitbelow = "splitright"
o.termguicolors = true
--hihglight yank
vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 300)
  augroup END
]]
-- vim.opt.signcolumn = "yes"
-- vim.opt.wrap = false
-- vim.opt.scrolloff = 8
-- vim.opt.sidescrolloff = 8





-- set color schema
vim.cmd("colorscheme catppuccin-mocha")

