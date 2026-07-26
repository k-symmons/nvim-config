-- Set Global & Local Leader Keys to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("kazuki.core.options")
require("kazuki.core.keymaps")

vim.lsp.enable("basedpyright")
