return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup()
			-- (sa: add, sd: delete, sr: replace)
			require("mini.surround").setup()
			require("mini.indentscope").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
		end,
	},
}
