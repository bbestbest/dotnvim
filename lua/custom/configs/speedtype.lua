local present, speedtyper = pcall(require, "speedtyper")

if not present then
  return
end

speedtyper.setup {
  time = 30,
  window = {
    height = 0.15, -- integer grater than 0 or float in range (0, 1)
    width = 0.55, -- integer grater than 0 or float in range (0, 1)
    border = "rounded", -- "none" | "single" | "double" | "rounded" | "shadow" | "solid"
  },
}
