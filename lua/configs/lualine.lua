local colors = {
  -- bg       = '#202328',
  bg = "#111826",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  -- check_git_workspace = function()
  --   local filepath = vim.fn.expand "%:p:h"
  --   local gitdir = vim.fn.finddir(".git", filepath .. ";")
  --   return gitdir and #gitdir > 0 and #gitdir < #filepath
  -- end,
}

local config = {
  disabled_filetypes = { statusline = { "alpha" } },
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      -- normal = { c = { fg = colors.fg, bg = colors.bg } },
      normal = { c = { fg = colors.fg } },
      -- inactive = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.orange }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- return ""
    -- return "✮⋆˙"
    return ""
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.fg,
      i = colors.fg,
      v = colors.fg,
      [""] = colors.fg,
      V = colors.fg,
      c = colors.fg,
      no = colors.fg,
      s = colors.fg,
      S = colors.fg,
      [""] = colors.fg,
      ic = colors.fg,
      R = colors.fg,
      Rv = colors.fg,
      cv = colors.fg,
      ce = colors.fg,
      r = colors.fg,
      rm = colors.fg,
      ["r?"] = colors.fg,
      ["!"] = colors.fg,
      t = colors.fg,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  "branch",
  icon = "",
  color = { fg = "#add7ff", gui = "bold" },
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.orange, gui = "bold" },
}

ins_left {
  "filesize",
  cond = conditions.buffer_not_empty,
}

ins_left { "location" }

ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- ins_left {
--   require("noice").api.statusline.mode.get,
--   cond = require("noice").api.statusline.mode.has,
--   color = { fg = colors.orange },
-- }

ins_right {
  function()
    local msg = "󰑊 No Active LSP"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
}

ins_right {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = "bold" },
}

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.fg, gui = "bold" },
}

ins_right {
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "󰝤 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.orange },
  padding = { left = 1 },
}

require("lualine").setup(config)
