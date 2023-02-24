local present, find_cmdline = pcall(require, "fine-cmdline")

if not present then
  return
end

find_cmdline.setup {
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ": ",
  },
  popup = {
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      height = "50px",
      width = "20%",
    },
    border = {
      text = {
        top = "I WILL HAVE ORDER",
        top_align = "center",
        bottom = "𒆙  𒆙  𒆙  𒆙  𒆙  ",
        bottom_align = "center",
      },
      style = "rounded",
    },
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
