return {
	{
	  "Diogo-ss/42-header.nvim",
	  cmd = { "Stdheader" },
	  keys = { "<F1>" },
	  opts = {
		default_map = true,
		auto_update = true,
		user = "ksymmons",
		mail = "ksymmons@student.42tokyo.jp",
	  },
	  config = function(_, opts)
		require("42header").setup(opts)
	  end,
	},
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
		local norminette = require("norminette")
		norminette.setup({
				runOnSave = true,
				maxErrorsToShow = 5,
				active = true,
		})
	end,
	}
}
