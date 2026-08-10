return {
  {
    "williamboman/mason.nvim", -- core Mason plugin: installs LSP servers, linters, formatters
    build = ":MasonUpdate", -- refresh Mason registry after install/update
    config = function()
      require("mason").setup() -- init Mason with defaults
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim", -- bridges Mason installs to Neovim's built-in LSP API
    dependencies = {
      "williamboman/mason.nvim", -- load Mason first
      {
        "neovim/nvim-lspconfig", -- supplies the server configuration definitions
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
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
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- installs non-LSP tools (formatters/linters)
    dependencies = { "williamboman/mason.nvim" }, -- load mason first
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { -- tools to auto-install
          "black",        -- Python formatter
          "isort",        -- Python import sorter
          "ruff",         -- Python linter
          "mypy",         -- Python type checker
          "clang-format", -- C/C++ formatter
          "cpplint",      -- C/C++ linter
        },
        auto_update = false, -- don't auto-update on each start
        run_on_start = true, -- install missing tools on startup
        integrations = {
          ["mason-lspconfig"] = false, -- latest integration expects mason-lspconfig v2
        },
      })
    end,
  },
}
