return {
	-- lua
	{
		"bfredl/nvim-luadev",
		ft = "lua",
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
		event = "BufEnter"
	},
}
