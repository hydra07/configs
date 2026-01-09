return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				term_colors = true,
				integrations = {
					blink_cmp = true,
					mini = { enabled = true },
					mason = true,
					telescope = {
						enabled = true,
						styles = { "nvchad" },
					},
					lualine = true,
					neotree = true,
					dashboard = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					treesitter = true,
					which_key = true,
				},
				compile = { enabled = true },
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
