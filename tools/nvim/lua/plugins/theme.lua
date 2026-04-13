return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          neotree = true,
          treesitter = true,
          mason = true,
          indent_blankline = { enabled = true },
        },
        custom_highlights = function(colors)
          return {
            LineNr = { fg = colors.overlay1 }, 
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
          }
        end,
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
