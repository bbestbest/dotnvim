local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- b.code_actions.eslint,
  b.code_actions.eslint_d,

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

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  -- b.diagnostics.eslint,
  b.diagnostics.eslint_d,
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
