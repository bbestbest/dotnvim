local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    -- override = {
    --   ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
    --   ["vim.lsp.util.stylize_markdown"] = false,
    --   ["cmp.entry.get_documentation"] = false,
    -- },
    hover = {
      enabled = false,
    },
    documentation = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    message = {
      enabled = false,
    },
  },
  health = {
    checker = false, -- Disable if you don't want health checks to run
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}
