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


	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_current_context = true,
			show_current_context_start = true,
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},
			filetype_exclude = require("pickled-nvim").filetype_config.indent_blankline.exclude,
		},
		config = function(_, opts)
			 require("indent_blankline").setup(opts)
			-- TODO: can we make the current context bold in the same color?
			-- match these up with rainbow config for treesitter in language-support.lua
			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
		end
	},
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
