return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.comment").setup()
      -- require("mini.pairs").setup()
      -- require("mini.completion").setup()
	  require("mini.ai").setup()
	  require("mini.surround").setup()
	  require("mini.files").setup()
	  require("mini.pick").setup()
    end,
  }
