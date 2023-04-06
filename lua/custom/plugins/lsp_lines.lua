local present, lsp_lines = pcall(require, "lsp_lines")

if not present then
  return
end

lsp_lines.setup {}

vim.diagnostic.config { virtual_lines = { only_current_line = true } }
