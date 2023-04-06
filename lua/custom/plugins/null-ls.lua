local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  code_actions.eslint_d,

  formatting.deno_fmt,
  formatting.prettier,
  formatting.stylua,
  formatting.shfmt,

  diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  diagnostics.eslint_d,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = true }
        end,
      })
    end
  end,
}
