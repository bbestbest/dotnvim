local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.8 -- You can change this too

local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local window_w = screen_w * WIDTH_RATIO
local window_h = screen_h * HEIGHT_RATIO
local window_w_int = math.floor(window_w)
local window_h_int = math.floor(window_h)

require("toggleterm").setup {
  float_opts = {
    zindex = 50,
    width = window_w_int,
    height = window_h_int,
  },
}
