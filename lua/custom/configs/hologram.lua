local present, hologram = pcall(require, "hologram")

if not present then
  return
end

hologram.setup {
  auto_display = true
}
