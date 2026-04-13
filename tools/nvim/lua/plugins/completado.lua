return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", -- Autocompletado de palabras en el archivo
      "hrsh7th/cmp-path",   -- Autocompletado de rutas de archivos
      "L3MON4D3/LuaSnip",   -- Motor de recortes (necesario para que cmp funcione)
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab para bajar
          ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab para subir
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter para aceptar
          ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Espacio para forzar el menú
        }),
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
