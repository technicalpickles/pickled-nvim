return {
	-- git stuff
	{
		"tanvirtin/vgit.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			settings = {
				signs = {
					priority = require("pickled-nvim").sign_priorities.git,
				},
			},
		},
		event = "VeryLazy",
	},
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = true,
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewFileHistory",
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
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
		dependencies = { "tpope/vim-fugitive" },
	},
}
