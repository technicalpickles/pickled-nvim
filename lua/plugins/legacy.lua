local ui = require("pickled-nvim.ui")
local telescope = require("pickled-nvim.telescope")
local editor = require("pickled-nvim.editor")
local tabs = require("pickled-nvim.tabs")

return {
	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{ "tpope/vim-unimpaired" },

	-- toggling comments
	{ "tpope/vim-commentary" },

	-- make . work in more places
	{ "tpope/vim-repeat", },

	-- ide like features
	{ "ldelossa/nvim-ide" },

	-- ruby
	-- lua
	{
		"bfredl/nvim-luadev",
		ft = "lua",
	},

	-- language and filetype specific
	{ "technicalpickles/procfile.vim" },
	{
		"gpanders/editorconfig.nvim",
		on = "BufRead"
	},
	{ "kblin/vim-fountain" },

	{
		"princejoogie/chafa.nvim",
		opts = require('pickled-nvim.filetypes').opts.chafa,
		event = "BufReadPre",
		dependencies = {
			"plenary.nvim",
			"baleia.nvim"
		},
	},

	{"m00qek/baleia.nvim"},

	-- styling cursor, ident lines, etc
	{
		"yamatsum/nvim-cursorline",
		opts = ui.opts.cursorline,
		event = "BufRead"
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
		"nvim-telescope/telescope.nvim",
		dependencies = { "plenary.nvim" },
		keys = telescope.keys.telescope,
		config = telescope.config.telescope,
		command = "Telescope",
	},

	{"romgrk/fzy-lua-native", build = "make", event = "CmdlineEnter" },

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-fzy-native.nvim", build = "make" },
	{ "natecraddock/telescope-zf-native.nvim" },

	-- keep telescope from changing directory when picking files
	{ "desdic/telescope-rooter.nvim" },

	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "sqlite.lua" },
	},

	{
		"gfeiyou/command-center.nvim",
		dependencies = { "telescope.nvim" },
	},

	{
		"da-moon/telescope-toggleterm.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

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

	{ "sickill/vim-pasta" },
	{ "chentoast/marks.nvim" },
	-- multi-cursor
	{ "mg979/vim-visual-multi" },
	{ "ktunprasert/gui-font-resize.nvim" },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"ur4ltz/surround.nvim",
		event = "BufRead",
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

	-- for tabs and stuff
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			"nvim-web-devicons",
		},
		-- FIXME: find a way to not require, cmds undefined otherwise
		lazy = false,
		opts = tabs.opts.bufferline,
		keys = tabs.keys.bufferline,
	},

	-- quickfix and diagnostic type stuff
	{ "kevinhwang91/nvim-bqf" },
	{ "romainl/vim-qf" },

	-- search!
	{ "mhinz/vim-grepper", cmd = "Grepper" },

	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	-- session, remembering where we were
	{ "farmergreg/vim-lastplace" },
	{
		"rmagatti/auto-session",
		event = "VimEnter",
	},

	{
		'rmagatti/session-lens',
		dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
		cmd = "SearchSession"
	},

	{
		"tpope/vim-characterize",
		keys = {
			{"ga", "<Plug>(characterize)", "Print the unicode value of character in decimal, hex, and octal, HTML entity, Emoji, etc"}
		}
	},

	{ "gelguy/wilder.nvim" },
	{ 'amirrezaask/fuzzy.nvim', depends={'nvim-lua/plenary.nvim'}},

	{
		"roxma/nvim-yarp",
		build = "pip install -r requirements.txt",
	},


	-- directory specific path, etc
	{ "direnv/direnv.vim" },

	-- replace gx for URLs when netrw is disabled
	{ "tyru/open-browser.vim" },

	{
		"ggandor/leap.nvim",
		on = "BufRead",
	},

	{ "epwalsh/obsidian.nvim" },

	{ "mattboehm/vim-unstack" },

	{ "famiu/bufdelete.nvim" },
}
