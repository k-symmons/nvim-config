return {
  {
    "williamboman/mason.nvim", -- core Mason plugin: installs LSP servers, linters, formatters
    build = ":MasonUpdate", -- refresh Mason registry after install/update
    config = function()
      require("mason").setup() -- init Mason with defaults
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim", -- bridges Mason installs to lspconfig
    version = "^1.0.0", -- v2 requires the newer vim.lsp.enable() workflow
    dependencies = {
      "williamboman/mason.nvim", -- load Mason first
      {
        "neovim/nvim-lspconfig", -- provides legacy server setup()
        version = "^1.0.0",
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { -- LSP servers to auto-install
          "lua_ls",  -- Lua
          "pyright", -- Python
          -- "ts_ls",   -- TS/JS
          -- "gopls",   -- Go
          "clangd",  -- C/C++
        },
        automatic_installation = true, -- also install any server set up via lspconfig
      })

      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
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
