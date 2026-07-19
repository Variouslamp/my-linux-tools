return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      vim.defer_fn(function()
        require("nvim-treesitter").install({
          "python", "lua", "vim", "vimdoc", "bash",
          "markdown", "markdown_inline", "yaml", "toml",
          "json", "html", "css", "javascript", "typescript",
          "sql", "rust", "c",
        })
      end, 0)
    end,
  },
}
