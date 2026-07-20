return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    window = {
      position = "right", -- Esto moverá tu neotree a la derecha
    },
    filesystem = {
      follow_current_file = {
        enabled = true,   -- Versión corregida para evitar advertencias de Neovim
      },
      hijack_netrw_behavior = "open_default",
    },
  },
}

