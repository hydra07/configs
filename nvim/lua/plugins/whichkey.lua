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
				{ "<leader>w", group = "Window/Split" }, -- Nhóm Window & Split
				{ "<leader>b", group = "Buffer" }, -- Nhóm quản lý Tab/Buffer
				{ "<leader>v", group = "Neovide" }, -- Nhóm cho Neovide GUI
				{ "<leader>t", group = "Terminal" },
				{ ";", group = "Telescope/QuickActions" },
				{ ";h", desc = "Toggle Inlay Hints" },
			},
		},
		keys = {
			-- 1. FILE & SAVE
			{
				"<C-s>",
				"<cmd>w<cr><esc>",
				desc = "Save File",
				mode = { "n", "i", "v" },
			},
			{
				"<leader>fs",
				"<cmd>w<cr>",
				desc = "Save File",
			},
			{
				"<leader>fS",
				"<cmd>wa<cr>",
				desc = "Save All",
			},
			{
				"<leader>fn",
				"<cmd>enew<cr>",
				desc = "New File",
			},

			-- 2. WINDOW & SPLIT (Rất hay dùng)
			{
				"<leader>wv",
				"<cmd>vsplit<cr>",
				desc = "Split Vertical",
			},
			{
				"<leader>ws",
				"<cmd>split<cr>",
				desc = "Split Horizontal",
			},
			{
				"<leader>wd",
				"<cmd>close<cr>",
				desc = "Close Window",
			},
			{
				"<leader>wo",
				"<cmd>only<cr>",
				desc = "Close Others",
			},

			-- 3. BUFFER MANAGEMENT (Chuyển tab nhanh)
			{
				"<leader>bn",
				"<cmd>bnext<cr>",
				desc = "Next Buffer",
			},
			{
				"<leader>bp",
				"<cmd>bprevious<cr>",
				desc = "Prev Buffer",
			},
			{
				"<leader>bd",
				"<cmd>bdelete<cr>",
				desc = "Delete Buffer",
			},

			-- 4. NEOVIDE GUI OPTIMIZATION (Tăng giảm độ trong suốt nhanh)
			{
				"<leader>v+",
				function()
					vim.g.neovide_opacity = math.min(vim.g.neovide_opacity + 0.05, 1)
				end,
				desc = "Increase Transparency",
			},
			{
				"<leader>v-",
				function()
					vim.g.neovide_opacity = math.max(vim.g.neovide_opacity - 0.05, 0)
				end,
				desc = "Decrease Transparency",
			},

			-- 5. LSP & CODE (Giữ nguyên và bổ sung)
			{
				"<leader>la",
				vim.lsp.buf.code_action,
				desc = "Code Action",
			},
			{
				"<leader>lr",
				vim.lsp.buf.rename,
				desc = "Rename Symbol",
			},
			{
				"<leader>li",
				"<cmd>LspInfo<cr>",
				desc = "LSP Information",
			},
			{
				"<leader>lm",
				"<cmd>Mason<cr>",
				desc = "Mason Manager",
			},
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format Buffer",
			},
			{ "<leader>ci", "<cmd>ConformInfo<cr>", desc = "Conform Info" },

			-- 6. TERMINAL (Fix lỗi command cho bạn)
			{ "<leader>t1", "<cmd>1ToggleTerm direction=horizontal<cr>", desc = "Terminal 1 (Down)" },
			{ "<leader>t2", "<cmd>2ToggleTerm direction=vertical<cr>", desc = "Terminal 2 (Side)" },
			{ "<leader>t3", "<cmd>3ToggleTerm direction=float<cr>", desc = "Terminal 3 (Float)" },
			{ "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
			{ "<leader>tt", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },

			-- 7. KHÁC
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
		},
	},
}
