return {
  { "nvchad/volt", lazy = true },
  { "nvchad/minty", cmd = { "Shades", "Huefy" } },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  { import = "nvchad.blink.lazyspec" },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = false,
  },

  {
    "nvchad/showkeys",
    event = "VeryLazy",
    cmd = "ShowkeysToggle",
    opts = { timeout = 1, maxKeys = 5, position = "bottom-center" },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "options.nvimtree",
    dependencies = {
      { "b0o/nvim-tree-preview.lua", enabled = false },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = require "options.telescope",
    dependencies = {
      {
        "bbestbest/project.nvim",
        enabled = false,
        config = function()
          require "configs.project"
        end,
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "options.fzf",
  },

  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
          require "configs.lspconfig"
        end,
      },
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
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    config = function()
      require "configs.noice"
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    enabled = false,
    config = function()
      require "configs.lualine"
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    enabled = false,
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

  {
    "jinh0/eyeliner.nvim",
    event = "BufRead",
    config = function()
      require "configs.eyeliner"
    end,
  },

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
    event = "VeryLazy",
    config = function()
      require "configs.peek"
    end,
  },

  {
    "folke/trouble.nvim",
    enabled = false,
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.trouble"
    end,
  },

  {
    "blumaa/octopus.nvim",
    enabled = false,
  },

  {
    "yutkat/wb-only-current-line.nvim",
    enabled = false,
    event = "BufRead",
  },

  {
    "NStefan002/screenkey.nvim",
    enabled = false,
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
    "numToStr/Comment.nvim",
    event = "BufRead",
  },

  {
    "3rd/image.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require "configs.image"
    end,
  },

  -- {
  --   "p5quared/apple-music.nvim",
  --   enabled = false,
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = true,
  --   keys = require "configs.apple-music.keys",
  -- },

  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    dependencies = {
      {
        {
          "Cliffback/netcoredbg-macOS-arm64.nvim",
          dependencies = {
            "mfussenegger/nvim-dap",
            config = function()
              dofile(vim.g.base46_cache .. "dap")
              require "configs.nvim-dap"
            end,
          },
          config = function()
            require "configs.netcoredbg"
          end,
        },
      },
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },

  {
    "jbyuki/one-small-step-for-vimkind",
    enabled = false,
  },

  {
    "EL-MASTOR/bufferlist.nvim",
    enabled = false,
    event = "BufRead",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "BufferList",
  },

  {
    "mikavilpas/tsugit.nvim",
    event = "VeryLazy",
    opts = {
      keys = {
        force_quit = "<c-c>",
      },
    },
  },

  {
    "danilamihailov/beacon.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require "configs.beacon"
    end,
  },

  {
    "rachartier/tiny-glimmer.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require "configs.tiny-glimmer"
    end,
  },

  {
    "you-fail-me/git-drift.nvim",
    enabled = false,
    event = "BufRead",
  },

  {
    "Enigama/miss.nvim",
    enabled = false,
    event = "VeryLazy",
  },

  {
    "beargruug/skipper.nvim",
    enabled = false,
    event = "VeryLazy",
  },

  {
    "jackMort/ChatGPT.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup {
        openai_params = {
          model = "gpt-3.5-turbo",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    event = "VimEnter",
    priority = 1000,
    opts = {
      image = {
        enabled = true,
      },
      notifier = { enabled = true },
      input = { enabled = true },
    },
    keys = {
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win {
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 0,
            },
          }
        end,
      },
    },
  },

  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "configs.claude-code"
    end,
  },
}
