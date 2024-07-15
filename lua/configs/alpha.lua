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
local marginTopPercent = 0.04
local headerPadding = fn.max { 4, fn.floor(fn.winheight(0) * marginTopPercent) }

local LOGO = {
  -- { "pochita.jpg" },
  -- { "83144371_p0.jpg" },
  -- { "maxresdefault.jpg" },
  -- { "angel-with-astronaut.jpg" },
  -- { "109710923_p0.jpg" },
  -- { "ff7_midgar.jpg" },
  -- { "ff7_shinra.jpg" },
  -- { "id-captain.jpg" },
  { "honkai_star_rail.png" },
}

require "alpha.term"

local info = LOGO[1]
local LOGO_WIDTH = 100
local LOGO_HEIGHT = fn.floor(LOGO_WIDTH / 4)

local options = {
  logo = {
    ascii = {
      type = "text",
      val = require("configs.alpha-ascii").aventurine,
      opts = {
        position = "center",
        hl = "Alpha",
      },
    },
    images = {
      type = "terminal",
      -- command = "catimg -w " .. (LOGO_WIDTH * 2) .. " -l " .. os.getenv "HOME" .. "/.config/images/" .. info[1],
      command = "catimg -r 8 " .. os.getenv "CONFIG" .. "/images/" .. info[1],
      -- command = "chafa --clear --align mid,mid -d 5 --exact-size=auto --scale max "
      --   .. os.getenv "HOME"
      --   .. "/.config/images/"
      --   .. info[1],
      width = LOGO_WIDTH,
      height = LOGO_HEIGHT,
      opts = {
        redraw = true,
        noautocmd = true,
      },
    },
  },
  buttons = {
    type = "group",
    val = {
      -- button("n", " New File  ", ":ene <BAR> startinsert <CR>"),
      button("f", " Find Git File  ", ":Telescope find_files<CR>"),
      button("a", " Find All File  ", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>"),
      button("o", " Recent File  ", ":Telescope oldfiles<CR>"),
      button("w", " Find Word  ", ":Telescope live_grep<CR>"),
      button("m", "󰃀 Bookmarks  ", ":Telescope marks<CR>"),
      button("h", "󰃉 Themes  ", ":Telescope themes<CR>"),
      button("s", " Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
      button("q", "󰅚 Exit", "<cmd>qa<CR>"),
    },
    opts = {
      spacing = 1,
    },
  },
  info_date = {
    type = "text",
    val = os.date "Today is %A, %b %D",
    opts = {
      position = "center",
      hl = "Alpha",
    },
  },
  info_startup = {
    type = "text",
    val = "",
    opts = {
      position = "center",
      hl = "Alpha",
    },
  },
}

function layout()
  return {
    { type = "padding", val = headerPadding },
    options.logo.ascii,
    { type = "padding", val = 2 },
    options.info_date,
    { type = "padding", val = 2 },
    options.buttons,
    { type = "padding", val = 1 },
    options.info_startup,
    -- { type = "padding", val = headerPadding },
  }
end

require("alpha").setup {
  layout = layout(),
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "*",
        callback = function()
          local stats = require("lazy").stats()
          local count = (math.floor(stats.startuptime * 100) / 100)
          options.info_startup.val = {
            "󱐌 " .. stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. count .. " ms",
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
    margin = 5,
  },
}
