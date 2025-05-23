require("claude-code").setup {
  window = {
    split_ratio = 0.5,
    position = "vertical",
    enter_insert = true,
    hide_numbers = true,
    hide_signcolumn = true,
  },
  refresh = {
    enable = true,
    updatetime = 100,
    timer_interval = 1000,
    show_notifications = true,
  },
  git = {
    use_git_root = true,
  },
  command = "claude",
  keymaps = {
    window_navigation = true,
    scrolling = true,
  },
}
