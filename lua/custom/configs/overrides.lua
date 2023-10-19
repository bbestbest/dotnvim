local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
-- M.nvimtree = {
--   git = {
--     enable = true,
--   },
--
--   renderer = {
--     highlight_git = true,
--     icons = {
--       show = {
--         git = true,
--       },
--     },
--   },
-- }

-- M.nvimtree = {
--   filters = {
--     dotfiles = false,
--     exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
--   },
--   disable_netrw = true,
--   hijack_netrw = true,
--   hijack_cursor = true,
--   hijack_unnamed_buffer_when_opening = false,
--   update_cwd = true,
--   update_focused_file = {
--     enable = true,
--     update_cwd = false,
--   },
--   view = {
--     relativenumber = true,
--     adaptive_size = false,
--     side = "left",
--     width = {
--       min = 30,
--       max = 30,
--     },
--   },
--   git = {
--     enable = false,
--     ignore = true,
--   },
--   filesystem_watchers = {
--     enable = true,
--   },
--   actions = {
--     open_file = {
--       resize_window = true,
--     },
--     expand_all = {
--       exclude = { "node_modules" },
--     },
--   },
--   renderer = {
--     highlight_git = true,
--     highlight_opened_files = "none",
--     root_folder_label = false,
--
--     indent_markers = {
--       enable = false,
--     },
--
--     icons = {
--       show = {
--         file = true,
--         folder = true,
--         folder_arrow = true,
--         git = true,
--       },
--
--       glyphs = {
--         default = "",
--         symlink = "",
--         folder = {
--           default = "",
--           empty = "",
--           empty_open = "",
--           open = "",
--           symlink = "",
--           symlink_open = "",
--           arrow_open = "",
--           arrow_closed = "",
--         },
--         git = {
--           unstaged = "✗",
--           staged = "✓",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "★",
--           deleted = "",
--           ignored = "◌",
--         },
--       },
--     },
--   },
-- }

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

M.nvimtree = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    relativenumber = true,
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
    expand_all = {
      exclude = { "node_modules" },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "none",
    root_folder_label = false,

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return M