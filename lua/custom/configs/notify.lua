local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup {
  background_colour = "#000000",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = -1,
  max_width = 100,
  render = "default",
  stages = "fade",
  timeout = 1000,
  top_down = true,
}
