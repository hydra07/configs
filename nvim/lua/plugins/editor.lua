return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ ";f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ ";r", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Search Text)" },
			{ ";b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ ";;", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
			{ ";e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser (Root)" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = telescope.extensions.file_browser.actions
			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/*",
						"--glob=!**/build/*",
						"--glob=!**/dist/*",
						-- for node
						"--glob=!**/node_modules/*",
						"--glob=!**/.next/*",
						"--glob=!**/package-lock.json", -- Thường không ai grep trong file lock
						"--glob=!**/yarn.lock",
						"--glob=!**/pnpm.lock",
						"--glob=!**/bun.lock",
					},
					find_command = {
						"fd",
						"--type",
						"f",
						"--strip-cwd-prefix",
						"--hidden",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						"dist",
						"--exclude",
						"build",
						"--exclude",
						".next",
					},
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = { prompt_position = "top", preview_width = 0.55 },
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next, -- Đồng bộ với Blink.cmp
							["<C-k>"] = actions.move_selection_previous,
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
						},
					},
				},
				extensions = {
					file_browser = {
						-- theme = "ivy", -- Ivy là theme dạng thanh ngang phía dưới (rất Pro)
						hijack_netrw = true,
						hidden = true,
						mappings = {
							["i"] = {
								["<C-a>"] = fb_actions.create, -- add
								["<C-r>"] = fb_actions.rename, -- rename
								["<C-d>"] = fb_actions.remove, -- delete
								["<C-m>"] = fb_actions.move, -- move
								["<C-h>"] = fb_actions.toggle_hidden, -- toggle hidden
							},
						},
					},
				},
			})

			-- Kích hoạt extensions
			telescope.load_extension("file_browser")
			telescope.load_extension("fzf")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "ToggleTerm", "TermSelect", "ToggleTermToggleAll" },

		keys = {
			{ [[<C-\>]], "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal" },
		},
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				open_mapping = [[<C-\>]], -- Phím tắt chung để đóng/mở cái gần nhất
				hide_numbers = true,
				shade_terminals = false,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal", -- Mặc định nhét xuống dưới
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "single",
					winblend = 0,
				},
			})

			-- Hàm để mở Terminal với ID cụ thể
			-- Ví dụ: 1<C-\> mở terminal 1, 2<C-\> mở terminal 2
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					_G.set_terminal_keymaps()
				end,
			})
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<cr>",
				{ desc = "Terminal Horizontal" }
			)
			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
			vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Vertical" })
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (Root Dir)" },
		},
		opts = {
			filesystem = {
				filtered_items = {
					visible = true, -- show hidden files
					hide_dotfiles = false,
				},
				follow_current_file = { enabled = true }, -- show current file in tree
				use_libuv_file_watcher = true, -- auto refresh
			},
			window = {
				width = 30,
				mappings = {},
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		optional = true,
		opts = function(_, opts)
			if (vim.g.colors_name or ""):find("catppuccin") then
				opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
			end
		end,
	},
}
