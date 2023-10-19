local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
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
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require "custom.configs.telescope"
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    config = function()
      require "custom.configs.notify"
    end,
  },
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    config = function()
      require "custom.configs.noice"
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require "custom.configs.lsp_lines"
    end,
  },
  { "tpope/vim-surround", lazy = false },
  { "folke/which-key.nvim", enabled = false },
  -- { "itchyny/vim-cursorword", lazy = false },
  -- { "terryma/vim-multiple-cursors", lazy = false },
  { "jinh0/eyeliner.nvim", lazy = false },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
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
  -- {
  --   "NStefan002/speedtyper.nvim",
  --   enabled = false,
  --   lazy = false,
  -- },
  {
    "kessejones/git-blame-line.nvim",
    lazy = false,
    enabled = false,
    config = function()
      require "custom.configs.git-blame-line"
    end,
  },

  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require "custom.configs.blame"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    enabled = false,
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "gen740/SmoothCursor.nvim",
    enabled = false,
    config = function()
      require "custom.configs.smoothcursor"
    end,
  },
  -- {
  --   "edluffy/hologram.nvim",
  --   config = function()
  --     require("hologram").setup {
  --       auto_display = true,
  --     }
  --   end,
  -- },
  --
  -- {
  --   "giusgad/pets.nvim",
  --   lazy = false,
  --   dependencies = {
  --     { "edluffy/hologram.nvim", "MunifTanjim/nui.nvim" },
  --   },
  --   config = function()
  --     require "custom.configs.pets"
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
