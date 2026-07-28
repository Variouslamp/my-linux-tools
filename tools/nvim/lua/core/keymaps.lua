-- Neotree keymaps --

vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>")
vim.keymap.set("n", "E", vim.diagnostic.open_float, {
    desc = "Mostrar diagnóstico"
})
