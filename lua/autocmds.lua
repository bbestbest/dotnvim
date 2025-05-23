local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Helper function to create a named group
local function GroupName(name)
  return augroup(name, { clear = true })
end

-- Start Alpha when vim is opened with no arguments
autocmd("VimEnter", {
  desc = "Start Alpha when vim is opened with no arguments",
  group = GroupName "alpha_settings",
  callback = function()
    local should_skip = false
    if vim.fn.argc() > 0 or vim.fn.line2byte "$" ~= -1 or not vim.o.modifiable then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
          should_skip = true
          break
        end
      end
    end
    if not should_skip then
      require("alpha").start(true, require("alpha").default_config)
    end
  end,
})

-- Return to Alpha when the last buffer is closed
autocmd("BufDelete", {
  group = GroupName "alpha_return",
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Alpha"
    end
  end,
})

-- Disable automatic commenting on newlines
autocmd("BufEnter", {
  group = GroupName "disable_auto_comment",
  pattern = "*",
  command = "set formatoptions-=cro",
})