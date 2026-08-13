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
	  "k-symmons/42norm.nvim",
	  config = function()
		require("42norm").setup({
		  format_on_save = false,
		  header_on_save = false,
		  lint_on_change = true,
		  timeout = 3000,
		  ignore = {},
		})
	  end,
	}
}
