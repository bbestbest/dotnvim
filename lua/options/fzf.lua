local M = require "options.variables"

return {
  winopts = {
    row = M.center_y,
    col = M.center_x,
    width = M.window_w_int,
    height = M.window_h_int,
  },
  files = {
    rg_opts = [[--color=never --hidden --files -g "!.git --smart-case "]],
  },
  keymap = {
    builtin = {
      ["<C-u>"] = "preview-page-up",
      ["<C-d>"] = "preview-page-down",
      ["<C-b>"] = "preview-top",
      ["<C-f>"] = "preview-bottom",
    },
  },
}
