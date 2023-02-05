local g = vim.g

return {
	{
		"tpope/vim-bundler",
		event = "VeryLazy",
	},
	{
		"tpope/vim-rake",
		event = "VeryLazy",
	},
	{
		"tpope/vim-rails",
		dependencies = {"tpope/vim-projectionist"},
		event = "VeryLazy",
	},
	{
		-- evaluate if this is needed
		"vim-ruby/vim-ruby",
		enabled = false,
	},
	{
		"tpope/vim-rbenv",
		event = "VeryLazy",
	},
}
