local map = vim.keymap.set

-- General
map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Yank current line" })
map("n", "Y", "yy", { desc = "Yank current line" })
map("n", "<leader><leader>s", "<cmd>noa w<CR>", { desc = "Save without format" })
map("n", "<leader>O", "O<Esc>j", { desc = "Newline Above" })
map("n", "<leader>o", "o<Esc>k", { desc = "Newline Under" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>r", "<cmd>edit!<CR>", { desc = "Reload File" })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- Switch Buffer
map("n", "<leader>h", "<C-w>h", { desc = "Switch Buffer To Left" })
map("n", "<leader>j", "<C-w>j", { desc = "Switch Buffer To Bottom" })
map("n", "<leader>k", "<C-w>k", { desc = "Switch Buffer To Top" })
map("n", "<leader>l", "<C-w>l", { desc = "Switch Buffer To Right" })

-- Switch Tabs
map("n", "<TAB>", "<cmd>tabn<CR>", { desc = "Switch Next Tab" })
map("n", "<S-TAB>", "<cmd>tabp<CR>", { desc = "Switch Previous Tab" })

-- Split Buffer
map("n", "<leader>xv", "<C-w>v", { desc = "Split Buffer Veritical" })
map("n", "<leader>xh", "<C-w>s", { desc = "Split Buffer Horizontal" })

-- Tabufline
map("n", "<C-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next Tabufline" })
map("n", "<C-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Prev Tabufline" })
map("n", "<C-x>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close Buffer" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "Telescope Find references" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map({ "n", "t" }, "<C-\\><C-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.5 }
end, { desc = "Terminal Toggleable vertical term" })
map({ "n", "t" }, "<C-\\><C-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })
map({ "n", "t" }, "<C-\\><C-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })
-- map({ "n" }, "<A-i>", function()
--   require("toggleterm.terminal").Terminal:new({ direction = "float", cmd = "tmux", hidden = true }):toggle()
-- end, { desc = "Toggle Term" })

-- ToggleTerm
map({ "n", "t" }, "<leader><leader>lg", function()
  require("toggleterm.terminal").Terminal:new({ direction = "float", cmd = "lazygit", hidden = true }):toggle()
end, { desc = "Toggle Lazygit" })
map({ "n", "t" }, "<leader><leader>ld", function()
  require("toggleterm.terminal").Terminal:new({ direction = "float", cmd = "lazydocker", hidden = true }):toggle()
end, { desc = "Toggle Laydocker" })

-- Whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

-- Blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Blankline Jump to current context" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle By Line" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle By Visual Block" }
)

-- Blame
map("n", "<leader>g", "<cmd>BlameToggle virtual<CR>", { desc = "Toggle Blame" })

-- LSP
map("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle Deleted" })
map("n", "<leader>df", function()
  vim.diagnostic.open_float()
end)
-- map("n", "K", function()
--   vim.lsp.buf.hover()
-- end, { desc = "LSP Hover" })
-- map("n", "<C-k>", function()
--   vim.lsp.buf.hover()
-- end, { desc = "LSP Hover" })

-- LSP Lines
map("n", "<leader>ll", function()
  require("lsp_lines").toggle()
end, { desc = "Toggle LSP Lines" })

-- Stupid Octupus
map("n", "<leader>on", function()
  require("octopus").spawn()
end, {})
map("n", "<leader>off", function()
  require("octopus").removeLastOctopus()
end, {})
map("n", "<leader>ofa", function()
  require("octopus").removeAllOctopuses()
end, {})

-- Screenkey
map("n", "<leader>sk", "<cmd>Screenkey<CR>", { desc = "Toggle Screenkey" })
