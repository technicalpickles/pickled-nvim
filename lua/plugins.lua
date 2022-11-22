vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile | PackerInstall
  augroup end
]])

return require("packer").startup(function(use)
	-- package manager
	use("wbthomason/packer.nvim")

	-- ruby
	use("tpope/vim-bundler")
	use("tpope/vim-rake")
	use("tpope/vim-rails")

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
			{"honza/vim-snippets"},
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind.nvim")

	-- Speed up loading Lua modules in Neovim to improve startup time.
	-- Load before ay other lua plugins
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})
	-- filetypes
	-- drop in replacement for filetype.vim
	-- TODO: switch back to nathom/filetype.nvim after landing fix
	-- TODO: figure out why filetype=lock is being set from lua and where
	-- use{"technicalpickles/filetype.nvim", branch = "more-specific-cargo-lock"}
	use("technicalpickles/procfile.vim")

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

	-- better support for % to bounce between sets of matching text, ie parens, etc
	-- drop in replacement for matchit.vim
	use("andymass/vim-matchup")

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

	use({"nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({"nvim-telescope/telescope-fzy-native.nvim", run = 'make' })
	use("natecraddock/telescope-zf-native.nvim")

	use({
		"gfeiyou/command-center.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

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

	-- visual git integration
	use({ "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- more git!
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- project managementment
	use("ahmedkhalf/project.nvim")

	-- directory specific path, etc
	use("direnv/direnv.vim")

	-- colorschemes
	use("ayu-theme/ayu-vim")
	use("averak/laserwave.vim")
	use("rafamadriz/neon")
	use("folke/tokyonight.nvim")

	-- quicfix and diagnostic type stuff
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use("gpanders/editorconfig.nvim")
	use("mg979/vim-visual-multi")

	use({ "mhinz/vim-grepper", cmd = "Grepper" })
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	use({ "kevinhwang91/nvim-bqf" })

	use("romainl/vim-qf")

	use("sickill/vim-pasta")
	use("windwp/nvim-autopairs")
	use("ur4ltz/surround.nvim")
	use("AndrewRadev/splitjoin.vim")

	use {"akinsho/toggleterm.nvim", tag = '*'}
	-- so you can can vim in the terimal
	use "samjwill/nvim-unception"


	-- session, remembering where we were
	use("farmergreg/vim-lastplace")
	use("rmagatti/auto-session")

	use("tpope/vim-characterize")

	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function() end,
		requires = { "tami5/sqlite.lua" },
	})

	use("gelguy/wilder.nvim")
	use("raghur/fruzzy", { cmd = "fruzzy#install()" })

	use({
		"roxma/nvim-yarp",
		run = "pip install -r requirements.txt",
	})

	use("romgrk/fzy-lua-native", { run = "make", on = "CmdlineEnter" })

	use("ktunprasert/gui-font-resize.nvim")

	use("chentoast/marks.nvim")

	use("github/copilot.vim")
end)
