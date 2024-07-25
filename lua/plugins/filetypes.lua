return {
	-- lua
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

	-- rust
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- language and filetype specific
	{
		"technicalpickles/procfile.vim",
		event = "BufRead",
	},

	{
		"kblin/vim-fountain",
		event = "BufRead",
	},
	{
		"gpanders/editorconfig.nvim",
		event = "BufEnter",
	},
}
