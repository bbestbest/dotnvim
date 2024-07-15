local M = {}

M.override = {
  Comment = {},
  ["@comment"] = {},
  LineNr = {
    -- fg = "#5de4c7",
    fg = "#f97451",
  },
  Delimiter = {},
  Visual = {
    fg = "#add7ff",
    -- bg = "#303340",
  },
  CursorLine = {},
}

M.add = {
  Alpha = {
    -- fg = "#f97451",
    -- fg = "#FFFFFF",
    fg = "#FFD966",
    bold = true,
  },
  -- AlphaButton = {},
}

return M
