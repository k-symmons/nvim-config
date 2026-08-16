-- Set local options for no recursive mapping and silent command messages
local opts = { noremap = true, silent = true }

-- Always show which tool produced a diagnostic (e.g. 42norm, clangd, gcc).
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        format = function(diagnostic)
            local source = diagnostic.source or "diagnostic"
            return string.format("[%s] %s", source, diagnostic.message)
        end,
    },
    float = {
        source = "always",
    },
})


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
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Use 'x' to delete a character without copying to clipboard
vim.keymap.set("n", "x", '"_x', opts)

-- Clear search highlights with Ctrl+C in normal mode
vim.keymap.set("n", "<C-c>", ":nohl<CR>", opts)

-- Exit insert mode with Ctrl+C (acts like Escape)
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- Disable 'Q' to avoid accidentally entering Ex mode
vim.keymap.set("n", "Q", "<nop>", opts)

-- Global word replace (starts a search & replace for the word under the cursor)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word in file" })

-- Execute the current script/buffer directly inside Neovim
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- Run the compiler and Norminette independently so their output is unambiguous.
vim.keymap.set("n", "<leader>cg", "<cmd>make<CR>", { desc = "Compile with GCC" })
vim.keymap.set("n", "<leader>cn", "<cmd>!norminette %<CR>", { desc = "Run Norminette" })
vim.keymap.set("n", "<leader>cf", function()
    require("42norm").format()
end, { desc = "Format with 42norm" })
vim.keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostic source" })

-- Toggle only 42norm/Norminette diagnostics without affecting LSP diagnostics.
local norm_diagnostic_namespaces = {
    vim.api.nvim_create_namespace("norminette"),
    vim.api.nvim_create_namespace("norminette -R CheckDefine"),
}

vim.keymap.set("n", "<leader>ct", function()
    local enabled = vim.diagnostic.is_enabled({ ns_id = norm_diagnostic_namespaces[1] })

    for _, namespace in ipairs(norm_diagnostic_namespaces) do
        vim.diagnostic.enable(not enabled, { ns_id = namespace })
    end

    vim.notify("Norminette diagnostics " .. (enabled and "hidden" or "shown"))
end, { desc = "Toggle Norminette diagnostics" })

-- File actions
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format with LSP" })

-- Copy the absolute file path to the clipboard
vim.keymap.set("n", "<leader>fp", ":let @+ = expand('%:p')<CR>", { desc = "Copy absolute path" })

-- ==========================================
-- Window Management (Splits)
-- ==========================================
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- ==========================================
-- Tab Management
-- ==========================================
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tf", ":tab %<CR>", { desc = "Move buffer to tab" })

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
