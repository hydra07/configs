return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			spec = {
				{ "<leader>f", group = "File/Find" },
				{ "<leader>e", desc = "Explorer" },
				{ "<leader>g", group = "Git" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>w", group = "Window" },
				{ ";", group = "Telescope/QuickActions" },
				{ ";h", desc = "Toggle Inlay Hints" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename Symbol" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Information" },
			{ "<leader>lm", "<cmd>Mason<cr>", desc = "Mason Manager" },
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format Buffer",
			},
			{ "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
            { "<leader>t", group = "Terminal" },
{ "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
{ "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
{ "<leader>t3", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
{ "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
{ "<leader>tt", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
		},
	},
}

