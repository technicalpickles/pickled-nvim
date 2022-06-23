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
	-- Load before ay other lua plugins
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})

	use({
		"neoclide/coc.nvim",
		branch = "release",
	})

	-- drop in replacement for filetype.vim
	use("nathom/filetype.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"RRethy/nvim-treesitter-endwise",
	})

	use("yamatsum/nvim-cursorline")

	use("lukas-reineke/indent-blankline.nvim")
	use("p00f/nvim-ts-rainbow")

	use("folke/which-key.nvim")

	-- dashboard when starting à la startify
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

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

	use("ur4ltz/surround.nvim")

	-- terminal manager
	use({
		"akinsho/toggleterm.nvim",
		tag = "v1.*",
	})

	-- tree explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- for tabs and stuff
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	-- visual git integration
	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- more git!
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- project managementment
	use("ahmedkhalf/project.nvim")

	-- directory specific path, etc
	use("direnv/direnv.vim")

	-- linters, formatters, etc
	use("jose-elias-alvarez/null-ls.nvim")

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

	use("AndrewRadev/splitjoin.vim")

	use("gpanders/editorconfig.nvim")
	use("mg979/vim-visual-multi")

  use { "mhinz/vim-grepper",
    cmd = "Grepper"
  }

  use {'kevinhwang91/nvim-bqf'}

  use {'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }

  use 'romainl/vim-qf'
end)
