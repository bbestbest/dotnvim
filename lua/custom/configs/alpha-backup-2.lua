local present, alpha = pcall(require, "alpha")
if not present then
  return
end

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

LOGO = {
  { "test.txt", 54, 26 },
  { "lucy.txt", 46, 21 },
}

local dashboard = require "alpha.themes.dashboard"
require "alpha.term"

dashboard.opts.opts.noautocmd = true
dashboard.section.terminal.opts.redraw = true
local info = LOGO[2]
-- dashboard.section.terminal.command = "cat " .. os.getenv "HOME" .. "/.config/nvim/lua/custom/ui/" .. info[1]
dashboard.section.terminal.command = "cat ~/.config/nvim/lua/custom/ui/lucy.txt"
dashboard.section.terminal.width = info[2]
dashboard.section.terminal.height = info[3]

dashboard.opts.layout = {
  dashboard.section.terminal,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  dashboard.section.footer,
}

alpha.setup(dashboard.opts)
