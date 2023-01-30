local ui = require("pickled-nvim.ui")
local editor = require("pickled-nvim.editor")

return {
	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{
		"tpope/vim-unimpaired",
		on = "VeryLazy",
	},

	-- toggling comments
	{
		"tpope/vim-commentary",
		on = "VeryLazy"
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

	-- styling cursor, ident lines, etc
	{
		"yamatsum/nvim-cursorline",
		opts = ui.opts.cursorline,
		event = "VeryLazy"
	},

	-- "lukas-reineke/indent-blankline.nvim")
	-- "p00f/nvim-ts-rainbow")

	-- popups for suggestions when starting shortcuts
	{ "folke/which-key.nvim" },

	-- dashboard when starting à la startify
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-web-devicons" },
	},

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		'mrjones2014/legendary.nvim',
		-- sqlite is only needed if you want to use frecency sorting
		dependencies = 'kkharji/sqlite.lua'
	},

	{
		'stevearc/dressing.nvim',
		event = "VeryLazy",
		opts = require("pickled-nvim.ui").opts.dressing
	},

	-- various things for editing and jumping around
	{
		"Wansmer/sibling-swap.nvim",
		dependencies = { "nvim-treesitter" },
		event = "BufRead",
		opts = editor.opts.sibling_swap,
		keys = editor.keys.sibling_swap,
	},

	{
		"sickill/vim-pasta",
		on = "VeryLazy"
	},
	{
		"chentoast/marks.nvim",
		on = "VeryLazy"
	},
	-- multi-cursor
	{
		"mg979/vim-visual-multi",
		on = "VeryLazy"
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"ur4ltz/surround.nvim",
		event = "VeryLazy",
	},

	{
		"AndrewRadev/splitjoin.vim",
		event = "BufRead",
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

	{
		"epwalsh/obsidian.nvim",
		on = "VeryLazy",
	},

	{ "mattboehm/vim-unstack" },

	{ "famiu/bufdelete.nvim" },
}
