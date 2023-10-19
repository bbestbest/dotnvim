local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup {
  background_colour = "Normal",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = -1,
  minimum_width = 50,
  render = "minimal",
  stages = "slide",
  timeout = 2000,
  top_down = true,
  -- on_open = function(win)
  --   vim.api.nvim_win_set_config(win, { focusable = false })
  -- end,
}
