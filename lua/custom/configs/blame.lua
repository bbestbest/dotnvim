local present, blame = pcall(require, "blame")

if not present then
  return
end

blame.setup {
  virtual_style = "virtual",
}
