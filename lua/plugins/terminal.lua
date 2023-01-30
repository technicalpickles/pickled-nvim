local silent_noremap = {noremap = true, silent = true}
return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = false, -- set below so we can do it lazily
			insert_mapping = false,
			terminal_mappings = true,
		},
		cmd = {"ToggleTerm"},
		keys = {
			-- FIXME lazy not working, but command works
			{"<C-`>", '<Cmd>execute v:count . "ToggleTerm"<CR>', {
				desc = "Toggle Terminal",
				-- silent = true,
			}},
			{"<C-`>", '<Cmd>execute v:count . "ToggleTerm"<CR>', {
				desc = "Toggle Terminal",
				-- silent = true,
				mode = "i",
			}},

			{"<D-S-1>", "<Cmd>1ToggleTerm<CR>", silent_noremap},
			{"<D-S-2>", "<Cmd>2ToggleTerm<CR>", silent_noremap},
			{"<D-S-3>", "<Cmd>3ToggleTerm<CR>", silent_noremap},
			{"<D-S-4>", "<Cmd>4ToggleTerm<CR>", silent_noremap},
			{"<D-S-5>", "<Cmd>5ToggleTerm<CR>", silent_noremap},
			{"<D-S-6>", "<Cmd>6ToggleTerm<CR>", silent_noremap},
			{"<D-S-7>", "<Cmd>7ToggleTerm<CR>", silent_noremap},
			{"<D-S-8>", "<Cmd>8ToggleTerm<CR>", silent_noremap},
			{"<D-S-9>", "<Cmd>9ToggleTerm<CR>", silent_noremap},
		},
	},

	-- so you can can vim in the terimal
	{ "samjwill/nvim-unception" },

	{
		"da-moon/telescope-toggleterm.nvim",
		dependencies = {
			"toggleterm.nvim",
			"telescope.nvim",
			"nvim-lua/popup.nvim",
			"plenary.nvim",
		},
	},

}
