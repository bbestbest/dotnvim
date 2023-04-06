local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.relativenumber = true
opt.cursorline = true
-- opt.cursorcolumn = true
opt.termguicolors = true
opt.cmdheight = 0
opt.signcolumn = "text"
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

-- cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

g.toggle_theme_icon = ""
