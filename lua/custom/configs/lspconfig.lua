local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "tailwindcss", "lua_ls", "jsonls" }
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local override_on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    -- format on save
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr, async = async }
      end,
      desc = "[lsp] format on save",
    })
  end
  return on_attach(client, bufnr)
end


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = override_on_attach,
  }
end

-- lint
lspconfig["eslint"].setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      command = "silent! EslintFixAll",
    })
    return on_attach(client, bufnr)
  end,
}


-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  virtual_lines = true,
  virtual_text = false,
}
