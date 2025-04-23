require("notify").setup {
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
  render = "minimal",
  stages = "static",
  timeout = 5000,
  top_down = true,
}
