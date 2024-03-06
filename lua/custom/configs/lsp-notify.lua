local present, notify = pcall(require, "null-ls")

if not present then
  return
end

notify.setup {
  notify = require "notify",
}
