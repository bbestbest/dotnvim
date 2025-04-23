local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities
capabilities.workspace.workspaceFolders = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

local lspconfig = require "lspconfig"
local server_list = {
  one = { "html", "cssls", "lua_ls", "jsonls", "prismals", "rust_analyzer", "biome" },
  two = { "html", "cssls", "lua_ls", "jsonls", "prismals", "rust_analyzer" },
}
local servers = server_list.one

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local get_vue_server_path = function()
  local mason_registry = require "mason-registry"
  local get_package_path = function(server)
    return mason_registry.get_package(server):get_install_path()
  end
  local M = {}
  M.typescript = get_package_path "vue-language-server" .. "/node_modules/@vue/language-server"
  M.valor = get_package_path "vue-language-server" .. "/node_modules/typescript/lib"
  return M
end

lspconfig["tailwindcss"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "javascriptreact", "typescriptreact", "vue" },
}

lspconfig["volar"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = get_vue_server_path().valor,
    },
  },
}

lspconfig["yamlls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  },
}

lspconfig["ts_ls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = get_vue_server_path().typescript,
        languages = { "vue" },
      },
    },
  },
  -- add vue to filetypes
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    diagnostics = { ignoredCodes = { 6133 } },
  },
}

lspconfig["eslint"].setup {
  on_init = on_init,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "silent! EslintFixAll",
    })
    return on_attach(client, bufnr)
  end,
}

lspconfig["docker_compose_language_service"].setup {}

lspconfig["rust_analyzer"].setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
}

local function set_filetype(pattern, filetype)
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = pattern,
    command = "set filetype=" .. filetype,
  })
end

set_filetype({ "docker-compose.yml" }, "yaml.docker-compose")

lspconfig["dockerls"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
}

lspconfig["csharp_ls"].setup {}

lspconfig["marksman"].setup {}

-- override vim
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = true,
  signs = true,
  update_in_insert = false,
  underline = true,
}

-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
--   config = config or {}
--   config.focus_id = ctx.method
--   if not (result and result.contents) then
--     return
--   end
--   local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--   markdown_lines = vim.split(markdown_lines, "\n", { trimempty = true })
--   if vim.tbl_isempty(markdown_lines) then
--     return
--   end
--   return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
-- end
