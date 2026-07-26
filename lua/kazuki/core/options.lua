-- disable banner for nvim default file explorer
vim.cmd("let g:netrw_banner = 0")

-- change cursor behavior to block cursor
-- vim.opt.guicursor = ""
-- enable absolute line number
vim.opt.nu = true
-- enable relative line number
vim.opt.relativenumber = true

-- define "Tab" charactor(/t) to show 4 spaces
vim.opt.tabstop = 4
-- define "Tab" key to move 4 spaces
vim.opt.softtabstop = 4
-- define how many spaces >> or << moves
vim.opt.shiftwidth = 4
-- convert tabs into spaces
vim.opt.expandtab = true
-- add new lines to the same indentation
vim.opt.autoindent = true
-- Do smart autoindenting when starting a new line.
vim.opt.smartindent = true
-- change if code wraps to next line when it gets too long on a line
vim.opt.wrap = false

-- option to turn on/off built in backup files. Start creating when you start editing. Mainly for crash recovery
vim.opt.swapfile = false
-- option to turn on/off backup. Created when you save a file, and it keeps the previous version as backup.
vim.opt.backup = false
-- option for persistant undo. On would make it so that undo's still persist even after nvim restart.
vim.opt.undofile = true


-- While typing a search command, show where the pattern, as it was typed so far, matches.
vim.opt.incsearch = true
--[[
Possible values:
	nosplit	Shows the effects of a command incrementally in the
			buffer.
	split	Like "nosplit", but also shows partial off-screen
			results in a preview window. 
--]]
vim.opt.inccommand = "split"
-- ignore case when searching 
vim.opt.ignorecase = true
-- overides ignorecase if pattern includes uppercase. Ex: "ignore" would search "ignore", "Ignore", "IGNORE". "Ignore" would serach "Ignore" only.
vim.opt.smartcase = true


-- Enables 24-bit RGB color in the TUI.
vim.opt.termguicolors = true
-- dark or light mode
vim.opt.background = "dark"
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- When and how to draw the signcolumn.  Valid values are:auto,no,yes,number
vim.opt.signcolumn = "yes"

-- influences the working of backspace,del,ctrl-w and ctrl-u in incert mode
vim.opt.backspace = {"start","eol","indent"}

-- new vertical splits (:vsplit) open to the right of the current window, instead of Vim's default of opening to the left.
vim.opt.splitright = true
-- new horizontal splits (:split) open below the current window, instead of Vim's default of opening above.
vim.opt.splitbelow = true

-- allows "@" to be in filename
vim.opt.isfname:append("@-@")
-- update timer for events(lsp's etc)
vim.opt.updatetime = 50
-- puts a vertical line in nvim
-- vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus" -- Sync Neovim clipboard with system clipboard
vim.opt.mouse = "a"             -- Enable mouse support in all modes
vim.g.editorconfig = true       -- Enable consistent coding styles across editors
