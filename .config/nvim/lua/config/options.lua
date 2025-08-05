-- Basics
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "120"

-- Indentation
local indent = 2
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true -- Use spaces rather than tabs
vim.opt.preserveindent = true
vim.opt.shiftround = true
vim.opt.shiftwidth = indent
vim.opt.smartindent = true
vim.opt.tabstop = indent
