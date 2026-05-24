return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "alpha", "dashboard", "help", "lazy",
          "neo-tree", "notify", "toggleterm", "Trouble",
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#A0A8B8" })
      vim.api.nvim_set_hl(0, "IblScope",  { fg = "#C0C8D8" })
      require("ibl").setup(opts)
    end,
  },
}
