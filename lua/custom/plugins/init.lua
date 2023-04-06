return {
  -- ["lewis6991/gitsigns.nvim"] = { disable = true },

  ["windwp/nvim-autopairs"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    after = "base46",
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["folke/trouble.nvim"] = {
    disable = true,
    config = function()
      require "custom.plugins.trouble"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "custom.plugins.lspconfig"
    end,
  },
  ["rcarriga/nvim-notify"] = {
    config = function()
      require "custom.plugins.notify"
    end,
  },

  ["tpope/vim-surround"] = {},

  -- license issue
  ["giusgad/pets.nvim"] = {
    disable = true,
    config = function()
      require "custom.plugins.pets"
    end,
  },

  ["nvim-lua/popup.nvim"] = {},

  ["nvim-telescope/telescope-media-files.nvim"] = {},

  ["edluffy/hologram.nvim"] = {
    disable = true,
    config = function()
      require "custom.plugins.hologram"
    end,
  },

  ["m00qek/baleia.nvim"] = {},

  ["princejoogie/chafa.nvim"] = {
    wants = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    config = function()
      require "custom.plugins.chafa"
    end,
  },

  ["MunifTanjim/nui.nvim"] = {},

  ["VonHeikemen/fine-cmdline.nvim"] = {
    disable = true,
    wants = "MunifTanjim/nui.nvim",
    config = function()
      require "custom.plugins.fine-cmdline"
    end,
  },

  ["folke/noice.nvim"] = {
    disable = false,
    wants = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.plugins.noice"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },

  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    config = function()
      require "custom.plugins.lsp_lines"
    end,
  },

  ["xiyaowong/nvim-transparent"] = {
    disable = true,
    config = function()
      require "custom.plugins.transparent"
    end,
  },

  ["alanfortlink/blackjack.nvim"] = {
    wants = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.plugins.blackjack"
    end,
  },

  ["alec-gibson/nvim-tetris"] = {},

  ["yamatsum/nvim-cursorline"] = {
    disable = true,
    config = function()
      require "custom.plugins.cursorline"
    end,
  },
}
