local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
return {
	{
		"axkirillov/hbac.nvim",
		opts = {
			threshold = 20,
		},
		cmd = "Hbac",
		event = "VeryLazy",
		keys = {
			{ "<D-k>", "<cmd>Hbac telescope<CR>", silent_noremap_both_modes },
		},
	},
}
