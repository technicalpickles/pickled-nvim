local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
return {
	{
		"axkirillov/hbac.nvim",
		opts = {
			threshold = 20,
			telescope = {
				pin_icons = {
					unpinned = { "" },
					pinned = { "󰐃", hl = "DiagnosticError" },
				},
			},
		},
		cmd = "Hbac",
		event = "VeryLazy",
		keys = {
			{ "<D-k>", "<cmd>Hbac telescope<CR>", silent_noremap_both_modes },
		},
		command_center = {
			{ desc = "Buffer: Toggle Pin", cmd = "<CMD>Hbac toggle_pin<CR>" },
			{ desc = "Buffer: Close Unpinned", cmd = "<CMD>Hbac close_unpinned<CR>" },
			{ desc = "Buffer: Toggle Autoclose", cmd = "<CMD>Hbac toggle_autoclose<CR>" },
		},
	},
}
