local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- última versión estable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Pluguins instalador --

require("lazy").setup({
  -- EXPLORADOR DE ARCHIVOS
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons",
  --

})

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

 -- Configuracion de pliguin --

require("neo-tree").setup({
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_default",
  },
})

 -- atajos de teclado --

vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>")

