local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup {
  stages = "slide",
  on_open = nil,
  on_close = nil,
  timeout = 2000,
  -- fps = 120,
  render = "default",
  -- background_colour = 000000,
  -- minimum_width = 50,
  level = "TRACE",
  -- icons = {
  --   ERROR = icons.diagnostics.Error,
  --   WARN = icons.diagnostics.Warning,
  --   INFO = icons.diagnostics.Information,
  --   DEBUG = icons.ui.Bug,
  --   TRACE = icons.ui.Pencil,
  -- },
}

vim.notify = notify
