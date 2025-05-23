local M = {}

M.HEIGHT_RATIO = 0.8
M.WIDTH_RATIO = 0.8

M.screen_w = vim.opt.columns:get()
M.screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
M.window_w = M.screen_w * M.WIDTH_RATIO
M.window_h = M.screen_h * M.HEIGHT_RATIO
M.window_w_int = math.floor(M.window_w)
M.window_h_int = math.floor(M.window_h)
M.center_x = (M.screen_w - M.window_w) / 2
M.center_y = ((vim.opt.lines:get() - M.window_h) / 2) - vim.opt.cmdheight:get()

return M
