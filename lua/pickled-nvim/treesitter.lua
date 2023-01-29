local M = {}

M.opts = {
	treesitter = {
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
	}
}

M.config = {
	treesitter = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}

return M
