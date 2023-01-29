local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ui = require("pickled-nvim.ui")
local telescope = require("pickled-nvim.telescope")
local terminal = require("pickled-nvim.terminal")
local folds = require("pickled-nvim.folds")
local language_support = require("pickled-nvim.language-support")
local diagnostics = require("pickled-nvim.diagnostics")
local editor = require("pickled-nvim.editor")
local treesitter = require("pickled-nvim.treesitter")

local silent_noremap = { noremap = true, silent = true }

local plugins = {
	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{ "tpope/vim-unimpaired" },

	-- toggling comments
	{ "tpope/vim-commentary" },

	-- make . work in more places
	{ "tpope/vim-repeat", },

	-- lsp, linters, formatters, etc
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "VimEnter",
		config = language_support.config.lsp_zero,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "mtoohey31/cmp-fish" },
			{'zbirenbaum/copilot-cmp'},

			-- nice icons
			{ "onsails/lspkind.nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- { "rafamadriz/friendly-snippets" },
			-- use snipmate/ultisnip style snippets instead
			-- this has a lot more stars, and a little less problematic in ruby
			-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/61
			{ "honza/vim-snippets" },

			-- use `command` output as LSP for places that don't have one yet
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jayp0521/mason-null-ls.nvim"},
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = language_support.config.null_ls,
	},

	-- ide like features
	{ "ldelossa/nvim-ide" },
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		opts = language_support.opts.symbols_outline,
		keys = language_support.keys.symbols_outline,
	},

	-- ruby
	{ "tpope/vim-bundler" },
	{ "tpope/vim-rake" },
	{ "tpope/vim-rails" },
	{ "vim-ruby/vim-ruby" },

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
	{
		"preservim/vim-markdown",
		ft = "markdown",
		dependencies = { "godlygeek/tabular" },
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},
	{ "kblin/vim-fountain" },
	{
		"princejoogie/chafa.nvim",
		opts = require('pickled-nvim.filetypes').opts.chafa,
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim"
		},
	},

	-- treesitter, syntax, etc
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		on = "BufReadPost",
		config = treesitter.config.treesitter,
		opts = treesitter.opts.treesitter,
		dependencies = {
			"playground",
			"nvim-treesitter-textsubjects",
			"nvim-ts-context-commentstring",
			"vim-matchup"
		}
	},
	-- better support for % to bounce between sets of matching text, ie parens, etc
	-- drop in replacement for matchit.vim
	{ "andymass/vim-matchup" },
	-- debug info
	{
		"nvim-treesitter/playground",
		command = "TSPlaygroundToggle",
	},

	{
		"RRethy/nvim-treesitter-textsubjects",
	},
	-- determine what type of comments to use in multi-syntax files, ie css in html... use with commentary
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

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
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- customizable statusline with nice defaults
	{
		"nvim-lualine/lualine.nvim",
		config = require("pickled-nvim.ui").config.lualine,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		dependencies = { "kkharji/sqlite.lua" },
	},

	{
		"gfeiyou/command-center.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- for tabs and stuff
	{'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},

	-- git stuff
	{ "tanvirtin/vgit.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"} ,


	-- colorschemes
	{ "ayu-theme/ayu-vim", lazy = true },
	{ "averak/laserwave.vim", lazy = true },
	{ "rafamadriz/neon", lazy = true },
	{
		"folke/tokyonight.nvim",
		-- make sure it's first to avoid flicker
		lazy = false,
		priority = 1000
	},

	-- quickfix and diagnostic type stuff
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		-- FIXME explicitly setting up in pickled-nvim.diagnostics's setup
		on = "VimEnter",
		opts = diagnostics.opts.trouble,
		cmd = diagnostics.cmd.trouble,
		keys = diagnostics.keys.trouble,
	},
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

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		opts = terminal.opts.toggleterm,
		cmd = terminal.command.toggleterm,
		keys = terminal.keys.toggleterm,
	},
	-- so you can can vim in the terimal
	{ "samjwill/nvim-unception" },

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

	{
		'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					ft_disable = vim.g.filetype_plugin_config.copilot.disable,

					-- suggested to disable these when using with cmp
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end, 100)
		end,
	},

	{
		'zbirenbaum/copilot-cmp',
		dependencies = {'copilot.lua'},
		lazy = true,
		config = function ()
			require("copilot_cmp").setup {
				method = "getCompletionsCycling",
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			}
		end
	},

	-- directory specific path, etc
	{ "direnv/direnv.vim" },
	{ "tpope/vim-rbenv" },

	-- replace gx for URLs when netrw is disabled
	{ "tyru/open-browser.vim" },

	-- folds
	{
		'kevinhwang91/nvim-ufo',
		opts = folds.opts.ufo,
		keys = folds.keys.ufo,
		event = "BufRead",
		dependencies = 'kevinhwang91/promise-async',
	},

	{
		"ggandor/leap.nvim",
		on = "BufRead",
	},

	{ "epwalsh/obsidian.nvim" },

	{ "mattboehm/vim-unstack" },

	{ "famiu/bufdelete.nvim" },
}

require("lazy").setup(plugins)
