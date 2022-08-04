vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile | PackerInstall
  augroup end
]])

return require("packer").startup(function(use)
	-- package manager
	use("wbthomason/packer.nvim")

	use("tpope/vim-bundler")
	use("tpope/vim-rake")
	use("tpope/vim-rails")
	use("tpope/vim-projectionist")
	use("tpope/vim-unimpaired")

	-- lsp, linters, formatters, etc
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/nvim-lsp-installer" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "mtoohey31/cmp-fish" }, -- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
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

	-- drop in replacement for filetype.vim
	-- TODO: switch back to nathom/filetype.nvim after landing fix
	-- TODO: figure out why filetype=lock is being set from lua and where
	-- use{"technicalpickles/filetype.nvim", branch = "more-specific-cargo-lock"}

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("nvim-treesitter/nvim-treesitter-refactor")
	use("RRethy/nvim-treesitter-endwise")

	-- styling cursor, ident lines, etc
	use("yamatsum/nvim-cursorline")
	use("lukas-reineke/indent-blankline.nvim")
	use("p00f/nvim-ts-rainbow")

	use("folke/which-key.nvim")

	-- dashboard when starting à la startify
	use({ "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")

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

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"gfeiyou/command-center.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

	-- terminal manager
	use({ "akinsho/toggleterm.nvim", tag = "v1.*" })

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
end)
