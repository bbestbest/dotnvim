local options = {
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
  notify_no_formatters = true,
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    yaml = { "prettier" },
    -- css = { "prettier" },
    -- javascript = { "biome", "prettier", stop_after_first = true },
    javascript = { "prettier", stop_after_first = true },
    -- typescript = { "biome", "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    javascriptreact = { "prettier", "biome", stop_after_first = true },
    typescriptreact = { "prettier", "biome", stop_after_first = true },
    json = { "prettier" },
    vue = { "prettier" },
    cs = { "csharpier" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 5000,
  },
}

require("conform").setup(options)
