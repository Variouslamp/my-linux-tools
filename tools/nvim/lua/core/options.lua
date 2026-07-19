-- Configuracion de nvim
vim.opt.number = true
vim.opt.fillchars = { eob = " " }

-- Indentaciones y espacios
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Agregar ~/.local/bin al PATH para que nvim encuentre tree-sitter
local local_bin = vim.fn.expand("~/.local/bin")
vim.env.PATH = local_bin .. ":" .. vim.env.PATH

