return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = require("pickled-nvim").enabled("lewis6991/gitsigns.nvim"),
		opts = {
			linehl = false,
			numhl = true,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text_pos = "right_align",
			},
			sign_priority = require("pickled-nvim").sign_priorities.git,
		},
		event = "VeryLazy",
		cmd = "Gitsigns",
		config = function(_, plugin_opts)
			local gs = require("gitsigns")

			gs.setup(vim.tbl_deep_extend("error", plugin_opts, {
				-- based on recommendations in https://github.com/lewis6991/gitsigns.nvim#keymaps
				on_attach = function(bufnr)
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
					map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
					map("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
					map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
					map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
					map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, { desc = "Blame line" })
					map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame on current line" })
					map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end)
					map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			}))
		end,

		commander = {
			{ desc = "Git: Toggle Gutter", cmd = "<CMD>Gitsigns toggle_signs<CR>" },
			{ desc = "Git: Toggle Signs", cmd = "<CMD>Gitsigns toggle_numhl<CR>" },
			{ desc = "Git: Toggle Line Number Highlights", cmd = "<CMD>Gitsigns toggle_numhl<CR>" },
			{ desc = "Git: Toggle Line Text Highlights", cmd = "<CMD>Gitsigns toggle_linehl<CR>" },
			{ desc = "Git: Toggle Line olame", cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>" },
			{ desc = "Git: Toggle Word Diff", cmd = "<CMD>Gitsigns toggle_word_diff<CR>" },
		},
	},

	{
		"tpope/vim-fugitive",
		cmd = {
			"Git",
			"G",
			"Gdiffsplit",
			"Gread",
			"Ggrep",
			"Gwrite",
			"GMove",
			"GDelete",
			"GBrowse",
		},
		commander = {
			-- { desc = "GitHub: Copy Permalink", cmd = "<leader>gy" },
			{ desc = "GitHub: Open in Browser", cmd = "<CMD>GBrowse<CR>" },
		},
	},

	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
		dependencies = { "tpope/vim-fugitive" },
	},

	{
		"rmagatti/igs.nvim",
		opts = true,
		commander = {
			{
				desc = "Interactive Git Status: Edit Modified",
				cmd = function()
					require("igs").edit_modified()
				end,
			},
			{
				desc = "Interactive Git Status: Edit Added",
				cmd = function()
					require("igs").edit_added()
				end,
			},
			{
				desc = "Interactive Git Status: Edit All",
				cmd = function()
					require("igs").edit_all()
				end,
			},

			{
				desc = "Interactive Git Status: Quickfix Modified",
				cmd = function()
					require("igs").qf_modified({ all_changes = true })
				end,
			},
			{
				desc = "Interactive Git Status: Quickfix Added",
				cmd = function()
					require("igs").qf_added({ all_changes = true })
				end,
			},
			{
				desc = "Interactive Git Status: Quickfix All",
				cmd = function()
					require("igs").qf_all({ all_changes = true })
				end,
			},

			{
				desc = "Interactive Git Status: Quickfix Diff Branch",
				cmd = function()
					require("igs").qf_diff_branch({ all_changes = true })
				end,
			},

			{
				desc = "Interactive Git Status: Quickfix Conflicts",
				cmd = function()
					require("igs").qf_conflicts()
				end,
			},
		},
	},
}
