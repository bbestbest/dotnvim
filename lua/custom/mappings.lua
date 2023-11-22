---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-s>"] = "",
    ["<C-c>"] = "",

    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",

    ["<leader>v"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>uu"] = "",
    ["<leader>tt"] = "",

    ["<Up>"] = "",
    ["<Down>"] = "",

    ["<leader>b"] = "",
    ["<C-n>"] = "",

    ["<TAB>"] = "",
    ["<S-TAB>"] = "",

    ["K"] = "",
    ["<leader>x"] = "",
  },

  v = {
    ["<leader>/"] = "",
  },
}

M.switchwindow = {
  n = {
    ["<leader>h"] = { "<C-w>h", "window left" },
    ["<leader>l"] = { "<C-w>l", "window right" },
    ["<leader>j"] = { "<C-w>j", "window down" },
    ["<leader>k"] = { "<C-w>k", "window up" },
  },
}

M.general = {
  n = {
    ["Y"] = { "yy", "yank current line" },
    ["<TAB>"] = { "gt", "next tab" },
    ["<S-TAB>"] = { "gT", "next tab" },
    ["<C-c>"] = { "<C-w>c", "close tab" },
    ["<leader><leader>s"] = { ":noa w<CR>", "close tab" },
  },
}

M.splitwindow = {
  n = {
    ["<leader>sv"] = { "<C-w>v", "split window vertically" },
    ["<leader>sh"] = { "<C-w>s", "split window horizontally" },
    ["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
    ["<leader>sx"] = { ":close<CR>", "make split windows equal width & height" },
  },
}

M.linenumber = {
  n = {
    ["<leader>n"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
  },
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.lsp = {
  n = {
    ["<C-k>"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
  },
}

M.tabufline = {
  n = {
    ["<C-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<C-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<C-x>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.comment = {
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fi"] = { "<cmd> Telescope media_files <CR>", "find images" },
  },
}

-- M.finecmd = {
--   n = {
--     [":"] = { "<cmd>FineCmdline<CR>" },
--   },
-- }

M.alpha = {
  n = {
    ["<leader>b"] = { "<cmd>Alpha<CR>" },
  },
}

M.lsplines = {
  n = {
    ["<leader>ll"] = {
      function()
        require("lsp_lines").toggle()
      end,
       "Toggle lsp_lines" ,
    },
  },
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<A-w>"] = {
      function()
        require("nvterm.terminal").toggle "image"
      end,
      "toggle image term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-w>"] = {
      function()
        require("nvterm.terminal").toggle "image"
      end,
      "toggle image term",
    },
  },
}

return M

