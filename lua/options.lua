require "nvchad.options"

local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.cursorline = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"
opt.swapfile = false
opt.termguicolors = true

g.toggle_theme_icon = ""
g.statusline = ""
