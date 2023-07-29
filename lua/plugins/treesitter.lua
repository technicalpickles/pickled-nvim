return {
	-- treesitter, syntax, etc
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			ensure_installed = "all",
			ignore_install = { "phpdoc" },

			-- -- FIXME: seems to break alignment of some ruby
			highlight = {
				enable = true,
				-- work around bad treesitter indentation, esp for ruby
				-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1019
				additional_vim_regex_highlighting = true,
			},

			-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
			context_commentstring = {
				enable = true,
			},

			-- https://github.com/andymass/vim-matchup
			matchup = {
				enable = true,
			},

			-- these work in visual mode
			textsubjects = {
				enable = true,
				prev_selection = ",", -- (Optional) keymap to select the previous selection
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter" },
		event = "VeryLazy",
		opts = {
			patterns = {
				-- remove when/if https://github.com/nvim-treesitter/nvim-treesitter-context/pull/201 lands
				ruby = {
					"block",
				},
				lua = {
					"table_constructor",
				},
			},
		},
	},

	-- better support for % to bounce between sets of matching text, ie parens, etc
	-- drop in replacement for matchit.vim
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
	},

	-- debug info
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
		command_center = {
			{ desc = "Treesitter: Toggle Playground", cmd = "<CMD>TSPlaygroundToggle<CR>" },
		},
	},

	{
		"RRethy/nvim-treesitter-textsubjects",
		event = "VeryLazy",
	},
	-- determine what type of comments to use in multi-syntax files, ie css in html... use with commentary
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
}
