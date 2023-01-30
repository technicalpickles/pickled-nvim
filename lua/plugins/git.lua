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
		on = "VeryLazy",
	},
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = true,
		cmd = {
			'DiffviewOpen',
			'DiffviewClose',
			'DiffviewToggleFiles',
			'DiffviewFocusFiles',
			'DiffviewRefresh',
			'DiffviewFileHistory',
		}
	},
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },

}
