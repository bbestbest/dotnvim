local M = {}

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",

    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },

  n = {
    ["<C-s>"] = "",
    ["<C-c>"] = "",

    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",

    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>uu"] = "",
    ["<leader>tt"] = "",

    ["<Up>"] = "",
    ["<Down>"] = "",

    ["<leader>b"] = "",
    ["<C-n>"] = "",

    ["<leader>/"] = "",

    -- ["gD"] = "",
    -- ["gd"] = "",
    -- ["K"] = "",
    -- ["gi"] = "",
    -- ["<leader>ls"] = "",
    -- ["<leader>D"] = "",
    -- ["<leader>ra"] = "",
    -- ["<leader>ca"] = "",
    -- ["gr"] = "",
    -- ["<leader>f"] = "",
    -- ["[d"] = "",
    -- ["d]"] = "",
    -- ["<leader>q"] = "",
    -- ["<leader>fm"] = "",
    -- ["<leader>wa"] = "",
    -- ["<leader>wr"] = "",
    -- ["<leader>wl"] = "",
    --
    -- ["<leader>th"] = "",
    -- ["<leader>cm"] = "",
    -- ["<leader>gt"] = "",

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

-- M.lsp = {
--   n = {
--     ["<Leader>lf"] = {
--       function()
--         vim.lsp.buf.format { async = true }
--       end,
--       "lsp formatting",
--     },
--   },
-- }

M.tabufline = {
  n = {
    ["<C-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<C-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<C-x>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.comment = {
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
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

M.finecmd = {
  n = {
    [":"] = { "<cmd>FineCmdline<CR>" },
  },
}

return M
