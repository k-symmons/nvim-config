-- Set local options for no recursive mapping and silent command messages
local opts = { noremap = true, silent = true }


-- ==========================================
-- Visual Mode Mappings
-- ==========================================
-- Move highlighted lines visually (Shift + J / Shift + K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode when indenting visually
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste over selection without losing your current clipboard content
vim.keymap.set("x", "p", '"_dP', opts)

-- ==========================================
-- Normal Mode Mappings
-- ==========================================
-- Join the current line with the one below, keeping the cursor in place
vim.keymap.set("n", "J", "mzJ`z", opts)

-- Scroll half page down/up and center the cursor vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Jump to the next/previous search result and keep the result centered
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Delete without copying to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)

-- Use 'x' to delete a character without copying to clipboard
vim.keymap.set("n", "x", '"_x', opts)

-- Clear search highlights with Ctrl+C in normal mode
vim.keymap.set("n", "<C-c>", ":nohl<CR>", opts)

-- Exit insert mode with Ctrl+C (acts like Escape)
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- Disable 'Q' to avoid accidentally entering Ex mode
vim.keymap.set("n", "Q", "<nop>", opts)

-- Global word replace (starts a search & replace for the word under the cursor)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Execute the current script/buffer directly inside Neovim
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", opts)

-- Code formatting (requires an LSP attached)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

-- Copy the absolute file path to the clipboard
vim.keymap.set("n", "<leader>fp", ":let @+ = expand('%:p')<CR>", opts)

-- ==========================================
-- Window Management (Splits)
-- ==========================================
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- Split vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- Split horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- Make splits equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- ==========================================
-- Tab Management
-- ==========================================
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- Open a new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)     -- Go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)     -- Go to previous tab
vim.keymap.set("n", "<leader>tf", ":tab %<CR>", opts)    -- Move current buffer to a new tab

-- ==========================================
-- Autocommands
-- ==========================================
-- Highlight text when yanked (copied)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
