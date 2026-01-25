vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set mouse=")
vim.g.mapleader = " "
vim.keymap.set("n", "gd", vim.lsp.buf.definition,   { noremap = true, silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
