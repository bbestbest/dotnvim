local present, find_cmdline = pcall(require, "fine-cmdline")

if not present then
  return
end

find_cmdline.setup {
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = "╰─> ",
  },
  popup = {
    position = {
      row = "6%",
      col = "50%",
    },
    size = {
      width = "34%",
    },
    border = {
      text = {
        -- top = "   I WILL HAVE ORDER   ",
        top = " Cmdline ",
        top_align = "center",
        -- bottom = "   𒆙  𒆙  𒆙  𒆙  𒆙  𒆙    ",
        bottom_align = "center",
      },
      -- style = "rounded",
      style = {
        top_left = "╭",
        top = "─",
        top_right = "╮",
        left = "│",
        right = "│",
        bottom_left = "╰",
        bottom = "─",
        bottom_right = "╯",
      },
    },
    relative = "editor",
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  },
  -- hooks = {
  --   before_mount = function(input)
  --     -- code
  --   end,
  --   after_mount = function(input)
  --     -- code
  --   end,
  --   set_keymaps = function(imap, feedkeys)
  --     -- code
  --   end,
  -- },
}
