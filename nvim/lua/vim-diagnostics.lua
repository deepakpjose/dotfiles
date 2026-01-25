vim.diagnostic.config({
  virtual_text = {
    source = "always", -- show source in virtual text
    prefix = "●",      -- or "■", "▎"
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
  },
})

