return {
	{
		"saghen/blink.cmp",
		version = "*",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				preset = "none", --
				-- 1. ACCEPT
				["<Tab>"] = {
					function(cmp)
						if cmp.is_menu_visible() or cmp.is_ghost_text_visible() then
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				-- 2. SELECT
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				-- 3. ENTER: none
				["<CR>"] = { "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				--  show/hide docs
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				-- scroll docs
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				ghost_text = { enabled = true },
				menu = {
					border = "single",
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon" } },
					},
				},
				documentation = {
					window = { border = "single" },
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			fuzzy = {
				-- frecency = { enabled = true },
				-- proximity_bonus = { enabled = true },
				implementation = "prefer_rust_with_warning",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			cmdline = {
				enabled = true,
				keymap = {
					preset = "none",
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					["<C-e>"] = { "hide", "fallback" },
				},
				completion = {
					menu = {
						auto_show = true,
						draw = { columns = { { "label" } } },
					},
					list = { selection = { preselect = true, auto_insert = true } },
					ghost_text = { enabled = false },
				},
				sources = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" then
						return { "cmdline" }
					end
					return {}
				end,
			},
		},
	},
}
