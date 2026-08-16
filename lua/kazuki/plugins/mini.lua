return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.comment").setup()
      -- require("mini.pairs").setup()
      -- require("mini.completion").setup()
	  require("mini.ai").setup()
	  require("mini.surround").setup()
	  require("mini.files").setup({
	    mappings = {
	      close = "q",
	      go_in = "l",
	      go_out = "h",
	      go_in_plus = "L",
	      reset = "=",
	      reveal_cwd = "@",
	      show_help = "g?",
	      synchronize = "w",
	      trim_left = "<",
	      trim_right = ">",
	    },
	  })

	  local function open_current_file()
	    local path = vim.api.nvim_buf_get_name(0)
	    MiniFiles.open(path ~= "" and path or vim.uv.cwd(), false)
	  end

	  vim.keymap.set("n", "<leader>ee", open_current_file, { desc = "Open at current file" })
	  vim.keymap.set("n", "<leader>ec", function()
	    MiniFiles.open(vim.uv.cwd(), false)
	  end, { desc = "Open at working directory" })
	  require("mini.pick").setup()
    end,
  }
