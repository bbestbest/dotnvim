require "nvchad.options"

local opt = vim.opt
local g = vim.g
opt.relativenumber = true
opt.cursorline = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"
opt.swapfile = false
opt.termguicolors = true
opt.mouse = ""
opt.ignorecase = false
-- opt.wrap = true
-- opt.synmaxcol = 120
opt.syntax = "off"

g.toggle_theme_icon = nil
