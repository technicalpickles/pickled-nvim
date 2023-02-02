return {
	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{
		"tpope/vim-unimpaired",
		on = "VeryLazy",
	},

	-- make . work in more places
	{
		"tpope/vim-repeat",
		on = "VeryLazy"
	},


	-- lua
	{
		"bfredl/nvim-luadev",
		ft = "lua",
	},

	-- language and filetype specific
	{
		"technicalpickles/procfile.vim",
	},
	{ "kblin/vim-fountain" },
	{
		"gpanders/editorconfig.nvim",
		on = "VeryLazy"
	},


	-- "lukas-reineke/indent-blankline.nvim")
	-- "p00f/nvim-ts-rainbow")

	-- popups for suggestions when starting shortcuts
	{ "folke/which-key.nvim" },

	-- dashboard when starting à la startify

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		'mrjones2014/legendary.nvim',
		-- sqlite is only needed if you want to use frecency sorting
		dependencies = 'kkharji/sqlite.lua'
	},

	-- tree explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-web-devicons",
		},
	},

	-- search!
	{ "mhinz/vim-grepper", cmd = "Grepper" },

	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	-- session, remembering where we were

	{
		"tpope/vim-characterize",
		keys = {
			{"ga", "<Plug>(characterize)", "Print the unicode value of character in decimal, hex, and octal, HTML entity, Emoji, etc"}
		}
	},

	-- directory specific path, etc
	{ "direnv/direnv.vim" },

	-- replace gx for URLs when netrw is disabled
	{ "tyru/open-browser.vim" },

	{
		"ggandor/leap.nvim",
		on = "BufRead",
	},

	{ "mattboehm/vim-unstack" },

	{ "famiu/bufdelete.nvim" },
}
