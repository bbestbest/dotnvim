local M = require "options.variables"

return {
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    relativenumber = true,
    float = {
      enable = true,
      open_win_config = function()
        return {
          border = "rounded",
          relative = "editor",
          row = M.center_y,
          col = M.center_x,
          width = M.window_w_int,
          height = M.window_h_int,
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * M.WIDTH_RATIO)
    end,
  },
  git = {
    enable = false,
    -- ignore = true,
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
