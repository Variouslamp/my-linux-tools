return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          previewer = false,
          winblend = 10,
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "top",
            width = 0.8,
            height = 0.9,
          },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = { previewer = false },
          oldfiles = { previewer = false },
          live_grep = { previewer = false },
          buffers = { previewer = false },
          help_tags = { previewer = false },
        },
      })
    end,
  },
}
