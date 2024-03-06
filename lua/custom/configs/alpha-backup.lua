local present, alpha = pcall(require, "alpha")
if not present then
  return
end

-- require("base46").load_highlight "alpha"

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButton",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.025
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

require "alpha.term"
local logo = require "custom.configs.alpha-ascii"

local options = {
  header = {
    type = "text",
    val = logo.cypher,
    opts = {
      position = "center",
      -- hl = "AlphaHeader",
      hl = "Boolean",
      -- hl = "Type",
      -- hl = "SpecialComment",
      -- hl = "AlphaQuote",
    },
  },
  buttons = {
    type = "group",
    val = {
      { type = "text", val = logo.menu, opts = { hl = "Boolean", position = "center" } },
      button("f", "𒆙  Find Git File  ", ":Telescope find_files<CR>"),
      button("a", "𒆙  Find All File  ", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>"),
      -- button("i", "𒆙  Find Image  ", ":Telescope media_files<CR>"),
      button("o", "𒆙  Recent File  ", ":Telescope oldfiles<CR>"),
      button("w", "𒆙  Find Word  ", ":Telescope live_grep<CR>"),
      button("m", "𒆙  Bookmarks  ", ":Telescope marks<CR>"),
      button("h", "𒆙  Themes  ", ":Telescope themes<CR>"),
      button("s", "𒆙  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
      -- button("i", "  Find Image  ", ":Telescope media_files<CR>"),
      -- button("o", "  Recent File  ", ":Telescope oldfiles<CR>"),
      -- button("w", "  Find Word  ", ":Telescope live_grep<CR>"),
      -- button("m", "  Bookmarks  ", ":Telescope marks<CR>"),
      -- button("h", "  Themes  ", ":Telescope themes<CR>"),
      -- button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
    },
    opts = {
      spacing = 1,
    },
  },
  headerPaddingTop = { type = "padding", val = headerPadding },
  headerPaddingBottom = { type = "padding", val = 1 },
  footer = {
    type = "group",
    val = {
      -- {
      --   type = "text",
      --   val = os.date(" %d-%m-%Y   %H:%M:%S", os.time()),
      --   opts = {
      --     position = "center",
      --     hl = "Boolean",
      --   },
      -- },
      -- {
      --   type = "terminal",
      --   command = "chafa ~/Pictures/84137002_p1.png",
      --   width = 40,
      --   height = 40,
      --   opts = {
      --     position = "center",
      --     hl = "String",
      --   },
      -- },
    },
  },
}

-- options = require("core.utils").load_override(options, "goolord/alpha-nvim")

alpha.setup {
  layout = {
    options.headerPaddingTop,
    options.header,
    options.headerPaddingBottom,
    options.buttons,
    options.footer,
  },
  opts = {},
}
