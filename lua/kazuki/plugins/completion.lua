return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",

      {
        "windwp/nvim-autopairs",
        opts = {},
      },
    },

    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,

            -- Important for your `stdio.h>>` problem.
            behavior = cmp.ConfirmBehavior.Replace,
          }),
        }),

        sources = {
          { name = "nvim_lsp" },
        },
      })

      -- Integrate nvim-autopairs with accepted completions.
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
}
