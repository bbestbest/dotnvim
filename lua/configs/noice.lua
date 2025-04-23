require("noice").setup {
  cmdline = {
    format = {
      cmdline = { title = "I will have order", pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
    },
  },
  lsp = {
    progress = {
      enabled = false,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = "lsp_progress",
      --- @type NoiceFormat|string
      format_done = "lsp_progress_done",
      throttle = 300 / 10, -- frequency to update lsp progress message
      view = "virtualtext",
      -- view = "mini",
    },
    hover = {
      enabled = true,
      silent = true,
    },
    signature = {
      enabled = false,
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  health = {
    checker = false, -- Disable if you don't want health checks to run
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  popupmenu = { enabled = true },
  routes = {
    filter = {
      error = true,
      opts = { skip = true },
    },
  },
  views = {
    cmdline_popup = {
      border = {
        style = { "╭", "", "╮", "", "╯", "", "╰", "" },
        -- style = { "X", "", "X", "", "X", "", "X", "" },
        padding = { 1, 2 },
      },
      position = "50%",
      filter_options = {},
      -- win_options = {
      --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      -- },
    },
    popupmenu = {
      border = {
        style = "none",
      },
    },
  },
}
