local present, chafa = pcall(require, "chafa")

if not present then
  return
end

chafa.setup {
  render = {
    min_padding = 5,
    show_label = true,
  },
  events = {
    update_on_nvim_resize = true,
  },
}
