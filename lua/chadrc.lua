local highlights = require "highlights"

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "poimandres",
    transparency = true,
    -- hl_override = highlights.override,
    -- hl_add = highlights.add,
    integrations = { "trouble", "dap" },
  },
  ui = {
    -- telescope = { style = "borderless" },
    -- statusline = {
    --   enabled = false,
    --   theme = "default",
    --   separator_style = "block",
    -- },
    tabufline = {
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs" },
    },
  },
  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.5, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.2,
      col = 0.2,
      width = 0.6,
      height = 0.6,
      border = "single",
    },
  },
  mason = {
    pkgs = {
      "csharp-language-server",
      "csharpier",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "eslint-lsp",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "marksman",
      "prettier",
      "prisma-language-server",
      "rust-analyzer",
      "rustfmt",
      "stylua",
      "css-lsp",
      "tailwindcss-language-server",
      "typescript-language-server",
      "vue-language-server",
      "yaml-language-server",
    },
  },
}

return M
