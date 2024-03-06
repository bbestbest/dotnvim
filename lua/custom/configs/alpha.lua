local present, alpha = pcall(require, "alpha")
if not present then
  return
end

math.randomseed(os.time())

local function getDayOfWeek()
  local dayOfWeek = os.date "%w"
  if dayOfWeek == "0" then
    dayOfWeek = "7"
  end
  return tonumber(dayOfWeek)
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

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.025
local headerPadding = fn.max { 4, fn.floor(fn.winheight(0) * marginTopPercent) }

local LOGO = {
  { "pochita.jpg" },
  { "83144371_p0.jpg" },
  { "maxresdefault.jpg" },
  { "363826303_663909388942123_4081649912837060388_n.jpg" },
  { "109710923_p0.jpg" },
}

require "alpha.term"
local ascii = require "custom.configs.alpha-ascii"
local info = LOGO[5]

local options = {
  header = {
    -- type = "text",
    -- val = logo.cypher,
    -- opts = {
    --   position = "center",
    --   -- hl = "AlphaHeader",
    --   -- hl = "Boolean",
    --   -- hl = "Type",
    --   -- hl = "SpecialComment",
    --   -- hl = "AlphaQuote",
    -- },
    type = "terminal",
    command = "chafa --clear --align mid,mid -d 5 --exact-size=auto --scale max "
        .. os.getenv "HOME"
        .. "/.config/nvim/lua/custom/ui/image/"
        .. info[1],
    -- command = "catimg " .. os.getenv "HOME" .. "/.config/nvim/lua/custom/ui/image/" .. info[1],
    width = 300,
    height = 20,
    opts = {
      redraw = true,
      noautocmd = true,
    },
  },
  buttons = {
    type = "group",
    val = {
      { type = "text", val = ascii.menu, opts = { hl = "AlphaHeader", position = "center" } },
      button("f", " Find Git File  ", ":Telescope find_files<CR>"),
      button("a", " Find All File  ", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>"),
      -- button("i", "𒆙  Find Image  ", ":Telescope media_files<CR>"),
      button("o", " Recent File  ", ":Telescope oldfiles<CR>"),
      button("w", " Find Word  ", ":Telescope live_grep<CR>"),
      button("m", " Bookmarks  ", ":Telescope marks<CR>"),
      button("h", " Themes  ", ":Telescope themes<CR>"),
      button("s", " Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
    },
    opts = {
      spacing = 1,
    },
  },
  headerPaddingTop = { type = "padding", val = headerPadding },
  headerPaddingBottom = { type = "padding", val = 1 },
  footer = {
    type = "text",
    val = os.date(" %d-%m-%Y   %H:%M:%S", os.time()),
    opts = {
      position = "center",
      hl = "AlphaQuote",
    },
  },
}

-- options = require("core.utils").load_override(options, "goolord/alpha-nvim")

alpha.setup {
  layout = {
    options.headerPaddingTop,
    { type = "padding", val = 2 },
    {

      type = "text",
      val = ascii.weekdays[getDayOfWeek()],
      opts = {
        position = "center",
        hl = "AlphaQuote",
      },
    },
    { type = "padding", val = 2 },
    options.header,
    options.headerPaddingBottom,
    options.buttons,
    { type = "padding", val = 1 },
    options.footer,
  },
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd("DirChanged", {
        pattern = "*",
        group = "alpha_temp",
        callback = function()
          require("alpha").redraw()
          vim.cmd "AlphaRemap"
        end,
      })
      vim.api.nvim_create_autocmd("DirChanged", {
        pattern = "*",
        group = "alpha_temp",
        callback = function()
          require("alpha").redraw()
          vim.cmd "AlphaRemap"
        end,
      })
    end,
  },
}
