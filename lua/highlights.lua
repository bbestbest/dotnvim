local M = {}

M.override = {
  -- TabLine = {
  --   bg = "#303340",
  -- },
  -- TabLineFill = {
  --   bg = "#303340",
  -- },
  -- TbFill = {
  --   bg = "#303340",
  -- },
  Folded = {
    fg = "#A2A2B7",
  },
  TbBufOff = {
    fg = "#A2A2B7",
    -- fg = "#FFC552",
  },
  Comment = {
    fg = "#A2A2B7",
  },
  ["@comment"] = {
    fg = "#A2A2B7",
  },
  LineNr = {
    fg = "#A2A2B7",
    -- fg = "#FFC552",
    -- fg = "#F97451",
  },
  Delimiter = {},
  Visual = {
    fg = "#DFDFE5",
    bg = "#6F6F72",
    -- fg = "#ADD7FF",
    -- bg = "#303340",
  },
  CursorLine = {},
}

M.add = {
  Alpha = {
    -- fg = "#F97451",
    -- fg = "#FFFFFF",
    fg = "#FFD966",
    bold = true,
  },
  -- AlphaButton = {},
}

return M
