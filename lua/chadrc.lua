local highlights = require "highlights"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  transparency = true,

  tabufline = {
    lazyload = true,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
