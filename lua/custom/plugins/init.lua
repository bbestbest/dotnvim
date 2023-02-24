return {
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

  ["giusgad/pets.nvim"] = {
    config = function()
      require "custom.plugins.pets"
    end,
  },

  ["nvim-lua/popup.nvim"] = {},

  ["nvim-telescope/telescope-media-files.nvim"] = {},

  ["edluffy/hologram.nvim"] = {
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
    wants = "MunifTanjim/nui.nvim",
    config = function()
      require "custom.plugins.fine-cmdline"
    end,
  },
}
