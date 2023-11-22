local present, preview = pcall(require, "actions-preview")

if not present then
  return
end

preview.setup {
  telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.86,
      height = 0.8,
      prompt_position = "top",
      preview_cutoff = 20,
      preview_height = function(_, _, max_lines)
        return max_lines - 15
      end,
    },
  },
  nui = {
    preview = {
      size = "0%",
    },
  },
}
