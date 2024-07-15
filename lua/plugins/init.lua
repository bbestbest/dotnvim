return {
  {
    "NvChad/ui",
    event = "BufRead",
    config = function()
      require "nvchad"
      vim.opt.statusline = ""
    end,
  },

  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    enabled = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "options.telescope",
    dependencies = {
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "options.nvimtree",
    dependencies = {
      "b0o/nvim-tree-preview.lua",
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "zeioth/garbage-day.nvim",
    enabled = true,
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      aggressive_mode = true,
    },
  },

  {
    "goolord/alpha-nvim",
    cmd = "Alpha",

    config = function()
      require "configs.alpha"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      {
        "rcarriga/nvim-notify",
        config = function()
          require "configs.notify"
        end,
      },
    },
    config = function()
      require "configs.noice"
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    config = function()
      require "configs.lualine"
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    event = "BufRead",
    config = function()
      require "configs.toggleterm"
    end,
  },

  { "tpope/vim-surround", event = "BufRead" },

  {
    "echasnovski/mini.indentscope",
    event = "BufRead",
    config = function()
      require "configs.mini-indent"
    end,
  },

  { "weilbith/nvim-code-action-menu", event = "BufRead" },

  { "jinh0/eyeliner.nvim", event = "BufRead" },

  {
    "FabijanZulj/blame.nvim",
    event = "BufRead",
    config = function()
      require "configs.blame"
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    event = "BufRead",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    "folke/trouble.nvim",
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "options.trouble",
  },

  {
    "blumaa/octopus.nvim",
  },

  {
    "yutkat/wb-only-current-line.nvim",
    event = "BufRead",
  },

  {
    "NStefan002/screenkey.nvim",
    version = "*",
    event = "BufReadPre",
    cmd = "Screenkey",
    config = function()
      require "configs.screenkey"
    end,
  },

  {
    "edluffy/specs.nvim",
    enabled = false,
    config = function()
      require "configs.specs"
    end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "BufRead",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    event = "BufRead",
  },
}
