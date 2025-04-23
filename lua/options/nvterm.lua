return {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        border = "rounded",
        relative = "editor",
        row = 0.1,
        col = 0.1,
        -- width = WIDTH_RATIO,
        -- height = HEIGHT_RATIO,
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}
