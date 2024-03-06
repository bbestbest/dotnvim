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
    ["<leader>e"] = "",

    ["<Up>"] = "",
    ["<Down>"] = "",

    ["<leader>b"] = "",
    ["<C-n>"] = "",

    ["K"] = "",

    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
  },

  v = {
    ["<leader>/"] = "",
  },

  i = {
    ["jj"] = "",
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
    ["<C-c>"] = { "<C-w>c", "close tab" },
    ["<leader><leader>s"] = { ":noa w<CR>", "save without format" },

    ["<tab>"] = {
      ":tabn<CR>",
      "Goto next tab",
    },

    ["<S-tab>"] = {
      ":tabp<CR>",
      "Goto previous tab",
    },
  },
}

M.splitwindow = {
  n = {
    ["<leader>sv"] = { "<C-w>v", "split window vertically" },
    ["<leader>sh"] = { "<C-w>s", "split window horizontally" },
    ["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
    ["<leader>sx"] = { "<cmd>close<CR>", "make split windows equal width & height" },
  },
}

M.linenumber = {
  n = {
    ["<leader>n"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "toggle nvimtree" },
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

M.blame = {
  n = {
    ["<leader>g"] = { "<cmd>ToggleBlame virtual<CR>", "toggle blame" },
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
    ["<leader>fi"] = { "<cmd>Telescope media<CR>", "find images" },
    ["<leader>rg"] = { "<cmd>Telescope registers<CR>", "find registers" },
    ["<leader>cs"] = { "<cmd>Telescope commands<CR>", "find commands" },
    ["<leader>td"] = { "<cmd>Telescope todo-comments<CR>", "find todo comments" },
  },
}

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
      "Toggle lsp_lines",
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

M.lazy = {
  n = {
    ["<Leader>lg"] = {
      "<cmd>LazyGit<CR>",
    },
    ["<Leader>ld"] = {
      "<cmd>LazyDocker<CR>",
    },
  },
}

-- M.minimap = {
--   n = {
--     ["<Leader>m"] = {
--       "<cmd>MinimapToggle<CR>",
--     },
--   },
-- }

return M
