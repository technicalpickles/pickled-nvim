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

require("lazy").setup({
	-- package manager
	{"wbthomason/packer.nvim"},

	-- Speed up loading Lua modules in Neovim to improve startup time.
	-- Load before any other lua plugins
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	},

	-- per project alternate setup
	{ "tpope/vim-projectionist" },

	-- lots of handy shortcuts
	{ "tpope/vim-unimpaired" },

	-- toggling comments
	{ "tpope/vim-commentary" },

	-- make . work in more places
	{ "tpope/vim-repeat" },

	-- lsp, linters, formatters, etc
	{
		"VonHeikemen/lsp-zero.nvim",
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

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- { "rafamadriz/friendly-snippets" },
			-- use snipmate/ultisnip style snippets instead
			-- this has a lot more stars, and a little less problematic in ruby
			-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/61
			{ "honza/vim-snippets" },

			-- use command output as LSP for places that don't have one yet
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jayp0521/mason-null-ls.nvim"},
		},
	},

	-- nice icons
	{ "onsails/lspkind.nvim" },

	-- ide like features
	{
		"ldelossa/nvim-ide"
	},
	{ "simrat39/symbols-outline.nvim" },

	-- ruby
	{ "tpope/vim-bundler" },
	{ "tpope/vim-rake" },
	{ "tpope/vim-rails" },
	{ "vim-ruby/vim-ruby" },

	-- lua
	{ "bfredl/nvim-luadev" },

	-- language and filetype specific
	{ "technicalpickles/procfile.vim" },
	{ "gpanders/editorconfig.nvim" },
	{"preservim/vim-markdown", dependencies = { "godlygeek/tabular" }},
	{ "dhruvasagar/vim-table-mode" },
	{ "kblin/vim-fountain" },
	{
		"princejoogie/chafa.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim"
		},
	},

	-- treesitter, syntax, etc
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	-- debug info
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "RRethy/nvim-treesitter-textsubjects" },
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	-- determine what type of comments to use in multi-syntax files, ie css in html... use with commentary
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	-- adding end automatically
	{ "RRethy/nvim-treesitter-endwise" },
	-- better indentation
	{ "yioneko/nvim-yati" },

	-- fallback for indentation
	{ "yioneko/vim-tmindent" },

	-- styling cursor, ident lines, etc
	{ "yamatsum/nvim-cursorline" },
	-- "lukas-reineke/indent-blankline.nvim")
	-- "p00f/nvim-ts-rainbow")

	-- popups for suggestions when starting shortcuts
	{ "folke/which-key.nvim" },

	-- dashboard when starting à la startify
	{ "goolord/alpha-nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- customizable statusline with nice defaults
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{"romgrk/fzy-lua-native", run = "make", on = "CmdlineEnter" },

	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
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

    {'stevearc/dressing.nvim'},

	-- various things for editing and jumping around
	{
		"Wansmer/sibling-swap.nvim",
		dependencies = { "nvim-treesitter" },
	},
	{ "sickill/vim-pasta" },
	{ "chentoast/marks.nvim" },
	-- multi-cursor
	{ "mg979/vim-visual-multi" },
	{ "ktunprasert/gui-font-resize.nvim" },

	{ "windwp/nvim-autopairs" },
	{ "ur4ltz/surround.nvim" },

	{ "AndrewRadev/splitjoin.vim" },
	-- better support for % to bounce between sets of matching text, ie parens, etc
	-- drop in replacement for matchit.vim
	{ "andymass/vim-matchup" },

	-- tree explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- for tabs and stuff
	{'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},

	-- git stuff
	{ "tanvirtin/vgit.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"} ,


	-- colorschemes
	{ "ayu-theme/ayu-vim" },
	{ "averak/laserwave.vim" },
	{ "rafamadriz/neon" },
	{ "folke/tokyonight.nvim" },

	-- quicfix and diagnostic type stuff
	{"folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons"},
	{ "kevinhwang91/nvim-bqf" },
	{ "romainl/vim-qf" },

	-- search!
	{ "mhinz/vim-grepper", cmd = "Grepper" },
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},

	-- terminal
	{ "akinsho/toggleterm.nvim"},
	-- so you can can vim in the terimal
	{ "samjwill/nvim-unception" },

	-- session, remembering where we were
	{ "farmergreg/vim-lastplace" },
	{ "rmagatti/auto-session" },

	{
		'rmagatti/session-lens',
		dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
	},

	{ "tpope/vim-characterize" },

	{ "gelguy/wilder.nvim" },
	{ "raghur/fruzzy" }, { cmd = "fruzzy#install()" },

	{
		"roxma/nvim-yarp",
		run = "pip install -r requirements.txt",
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
		after = {'copilot.lua'},
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
	{'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},

	{ "ggandor/leap.nvim" },

	{ "epwalsh/obsidian.nvim" },
	{ "renerocksai/telekasten.nvim" },

	{ "mattboehm/vim-unstack" },

	{ "famiu/bufdelete.nvim" },
})
