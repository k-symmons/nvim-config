require {
  "williamboman/mason.nvim", -- core Mason plugin: installs LSP servers, linters, formatters
  build = ":MasonUpdate", -- refresh Mason registry after install/update
  config = function()
    require("mason").setup() -- init Mason with defaults
  end,
},
{
  "williamboman/mason-lspconfig.nvim", -- bridges Mason installs to lspconfig
  dependencies = { "williamboman/mason.nvim" }, -- load mason first
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { -- LSP servers to auto-install
        "lua_ls",   -- Lua
        "pyright",  -- Python
        "tsserver", -- TS/JS
        "gopls",    -- Go
        "clangd",   -- C/C++
      },
      automatic_installation = true, -- also install any server set up via lspconfig
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
    })
  end,
},
{
  "neovim/nvim-lspconfig", -- provides ready-made LSP server configs
  dependencies = { "williamboman/mason-lspconfig.nvim" }, -- ensure servers installed first
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({}) -- Python LSP
    lspconfig.clangd.setup({})  -- C/C++ LSP
    -- your other lspconfig setups here
  end,
},
