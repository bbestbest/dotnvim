require "nvchad.options"

local opt = vim.opt
local g = vim.g

-- Performance settings
opt.syntax = "off" -- Disable syntax highlighting for better startup time
-- opt.lazyredraw = true -- Don't redraw screen during macros

-- UI improvements
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
-- opt.conceallevel = 3

g.toggle_theme_icon = nil
