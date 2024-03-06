local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "dharmx/telescope-media.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "NvChad/base46",
    -- config = function()
    --   local ok, base46 = pcall(require, "base46")
    --
    --   if ok then
    --     base46.load_theme()
    --   end
    -- end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require "custom.configs.alpha"
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "custom.configs.notify"
    end,
  },
  {
    "mrded/nvim-lsp-notify",
    lazy = false,
    config = function()
      require "custom.configs.lsp-notify"
    end,
  },
  { "folke/which-key.nvim", enabled = false },
  {
    "folke/noice.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "rcarriga/nvim-notify" },
    },
    config = function()
      require "custom.configs.noice"
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require "custom.configs.lsp-lines"
    end,
  },
  { "tpope/vim-surround",   lazy = false },
  { "jinh0/eyeliner.nvim",  lazy = false },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require "custom.configs.lualine"
    end,
  },
  {
    "archibate/lualine-time",
    lazy = false,
    config = function()
      require "custom.configs.lualine-time"
    end,
  },

  { "weilbith/nvim-code-action-menu", enabled = false, cmd = "CodeActionMenu" },

  {
    "itchyny/calendar.vim",
    cmd = "Calendar",
  },
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require "custom.configs.blame"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  },
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = overrides.lazydocker,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "gorbit99/codewindow.nvim",
    enabled = false,
    config = function()
      require "custom.configs.codewindow"
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require "custom.configs.hologram"
    end,
  }
}

return plugins
