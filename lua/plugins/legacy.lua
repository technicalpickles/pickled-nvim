local g = vim.g
return {
	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{
		"tpope/vim-unimpaired",
		event = "BufRead",
	},


	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	{
		"tpope/vim-characterize",
		keys = {
			{"ga", "<Plug>(characterize)", "Print the unicode value of character in decimal, hex, and octal, HTML entity, Emoji, etc"}
		}
	},

	-- directory specific path, etc
	{ "direnv/direnv.vim" },

	-- replace gx for URLs when netrw is disabled
	{
		"tyru/open-browser.vim",
		keys = {
			-- open browser, since we disabled netrw
			{"gx", "<Plug>(openbrowser-smart-search)", {mode = { "v", "n" }}}
		},
		cmd = {
			"OpenBrowser",
			"OpenBrowserSearch",
		}
	},

	{
		"mattboehm/vim-unstack",
		cmd = {
			"UnstackFromText",
			"UnstackFromClipboard",
			"UnstackFromTmux",
			"UnstackFromSelection",
		},
		config = function()
			g.unstack_mapkey = ""
			g.unstack_populate_quickfix = 1
		end
	},

	{ "famiu/bufdelete.nvim" },
}
