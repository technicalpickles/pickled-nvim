local M = {}

M.opts = {
	toggleterm = {
		open_mapping = false, -- set below so we can do it lazily
		insert_mapping = false,
		terminal_mappings = true,
	}
}

local silent_noremap = {noremap = true, silent = true}
M.keys = {
	toggleterm = {
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
	}
}

M.command = {
	toggleterm = "ToggleTerm",
}

return M
