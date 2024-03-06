local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- b.code_actions.eslint,
  b.code_actions.eslint_d,
  b.code_actions.jsonlint,

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with {
  --   filetypes = {
  --     "angular",
  --     "css",
  --     "flow",
  --     "graphql",
  --     "html",
  --     "jsx",
  --     "javascript",
  --     "less",
  --     "markdown",
  --     "scss",
  --     "typescript",
  --     "tsx",
  --     "vue",
  --     -- "json",
  --     "yaml",
  --   },
  -- }, -- so prettier works only on these filetypes
  b.formatting.prettier,
  -- b.formatting.prettierd,
  -- b.formatting.eslint,
  -- b.formatting.stylua,

  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  -- b.diagnostics.eslint,
  -- b.diagnostics.shellcheck,
  b.diagnostics.eslint_d,
  b.diagnostics.jsonlint,
}

-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"

null_ls.setup {
  debug = false,
  sources = sources,

  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     -- format on save
  --     vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
  --     vim.api.nvim_create_autocmd(event, {
  --       buffer = bufnr,
  --       group = group,
  --       callback = function()
  --         vim.lsp.buf.format { bufnr = bufnr, async = async }
  --       end,
  --       desc = "[lsp] format on save",
  --     })
  --   end
  -- end,
}
