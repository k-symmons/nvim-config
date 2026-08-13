return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",

      -- Needed so LSP servers advertise nvim-cmp completion capabilities
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      vim.diagnostic.config({
        virtual_text = true,
      })

      -- Apply nvim-cmp completion capabilities to ALL LSP servers.
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd" },
        automatic_enable = true,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },

    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "black",
          "isort",
          "ruff",
          "mypy",
          "clang-format",
          "cpplint",
        },

        auto_update = false,
        run_on_start = true,

        integrations = {
          ["mason-lspconfig"] = false,
        },
      })
    end,
  },
}
