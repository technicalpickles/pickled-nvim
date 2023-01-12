vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile | PackerInstall
  augroup end
]])

return require("packer").startup(function(use)
	-- package manager
	use("wbthomason/packer.nvim")

	-- Speed up loading Lua modules in Neovim to improve startup time.
	-- Load before any other lua plugins
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})

	-- per project alternate setup
	use("tpope/vim-projectionist")

	-- lots of handy shortcuts
	use("tpope/vim-unimpaired")

	-- toggling comments
	use("tpope/vim-commentary")

	-- make . work in more places
	use("tpope/vim-repeat")

	-- lsp, linters, formatters, etc
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
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
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jayp0521/mason-null-ls.nvim"},
		},
	})

	-- nice icons
	use("onsails/lspkind.nvim")

	-- ide like features
	use("ldelossa/nvim-ide", { branch = "no-cursor-restore" })
	use("simrat39/symbols-outline.nvim")

	-- ruby
	use("tpope/vim-bundler")
	use("tpope/vim-rake")
	use("tpope/vim-rails")
	use("vim-ruby/vim-ruby")

	-- lua
	use("bfredl/nvim-luadev")

	-- language and filetype specific
	use("technicalpickles/procfile.vim")
	use("gpanders/editorconfig.nvim")
	use({"preservim/vim-markdown", requires = { "godlygeek/tabular" }})
	use("dhruvasagar/vim-table-mode")
	use("kblin/vim-fountain")

	-- treesitter, syntax, etc
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- debug info
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("RRethy/nvim-treesitter-textsubjects")
	use("nvim-treesitter/nvim-treesitter-refactor")
	-- determine what type of comments to use in multi-syntax files, ie css in html... use with commentary
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- adding end automatically
	use("RRethy/nvim-treesitter-endwise")
	-- better indentation
	use("yioneko/nvim-yati")

	-- fallback for indentation
	use("yioneko/vim-tmindent")

	-- styling cursor, ident lines, etc
	use("yamatsum/nvim-cursorline")
	use("lukas-reineke/indent-blankline.nvim")
	use("p00f/nvim-ts-rainbow")

	-- popups for suggestions when starting shortcuts
	use("folke/which-key.nvim")

	-- dashboard when starting à la startify
	use({ "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- customizable statusline with nice defaults
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Find, Filter, Preview, Pick. All lua, all the time.
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("romgrk/fzy-lua-native", { run = "make", on = "CmdlineEnter" })

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-fzy-native.nvim", run = "make" })
	use("natecraddock/telescope-zf-native.nvim")

	-- keep telescope from changing directory when picking files
	use("desdic/telescope-rooter.nvim")

	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "kkharji/sqlite.lua" },
	})

	use({
		"gfeiyou/command-center.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

	use({
		"da-moon/telescope-toggleterm.nvim",
		requires = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		'mrjones2014/legendary.nvim',
		-- sqlite is only needed if you want to use frecency sorting
		requires = 'kkharji/sqlite.lua'
	})

    use {'stevearc/dressing.nvim'}


	-- various things for editing and jumping around
	use({
		"Wansmer/sibling-swap.nvim",
		requires = { "nvim-treesitter" },
	})
	use("sickill/vim-pasta")
	use("chentoast/marks.nvim")
	-- multi-cursor
	use("mg979/vim-visual-multi")
	use("ktunprasert/gui-font-resize.nvim")

	use("windwp/nvim-autopairs")
	use("ur4ltz/surround.nvim")

	use("AndrewRadev/splitjoin.vim")
	-- better support for % to bounce between sets of matching text, ie parens, etc
	-- drop in replacement for matchit.vim
	use("andymass/vim-matchup")

	-- tree explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- for tabs and stuff
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- git stuff
	use({ "tanvirtin/vgit.nvim", requires = "nvim-lua/plenary.nvim" })
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"} )


	-- colorschemes
	use("ayu-theme/ayu-vim")
	use("averak/laserwave.vim")
	use("rafamadriz/neon")
	use("folke/tokyonight.nvim")

	-- quicfix and diagnostic type stuff
	use({"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"})
	use("kevinhwang91/nvim-bqf")
	use("romainl/vim-qf")

	-- search!
	use({ "mhinz/vim-grepper", cmd = "Grepper" })
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	-- so you can can vim in the terimal
	use("samjwill/nvim-unception")

	-- session, remembering where we were
	use("farmergreg/vim-lastplace")
	use("rmagatti/auto-session")

	use("tpope/vim-characterize")

	use("gelguy/wilder.nvim")
	use("raghur/fruzzy", { cmd = "fruzzy#install()" })

	use({
		"roxma/nvim-yarp",
		run = "pip install -r requirements.txt",
	})

	use {
		'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = function()
			vim.defer_fn(function()
				require('copilot').setup()
			end, 100)
		end,
	}

	use {
		'zbirenbaum/copilot-cmp',
		after = {'copilot.lua'},
		config = function ()
			require('copilot_cmp').setup()
		end
	}

	-- directory specific path, etc
	use("direnv/direnv.vim")
	use("tpope/vim-rbenv")

	-- replace gx for URLs when netrw is disabled
	use("tyru/open-browser.vim")

	-- folds
	use({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'})

	use("ggandor/leap.nvim")

	use("epwalsh/obsidian.nvim")
	use("renerocksai/telekasten.nvim")

	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim"
	-- 	}
	-- })

	use({
		'terror/chatgpt.nvim',
		run = 'pip3 install -r requirements.txt'
	})

	use("mattboehm/vim-unstack")

	use("famiu/bufdelete.nvim")
end)
