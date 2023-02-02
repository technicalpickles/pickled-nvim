return {
	{
		"chentoast/marks.nvim",
		on = "VeryLazy",
		opts = {
			sign_priority = require("pickled-nvim").sign_priorities.mark,
		}
	},

	{
		"sickill/vim-pasta",
		on = "VeryLazy",
	},

	{
		"mg979/vim-visual-multi",
		on = "VeryLazy",
		config = function()
			require('leap').add_default_mappings()
		end
	},

	{
		"AndrewRadev/splitjoin.vim",
		event = "BufRead",
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			check_ts = true,
			disable_filetype = require("pickled-nvim").filetype_config.autopairs.disable,
		},

		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			npairs.setup(opts)

			local cmp = require("cmp")
			local Rule = require("nvim-autopairs.rule")
			local ts_conds = require("nvim-autopairs.ts-conds")

			-- local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
			local not_inside_code_block = ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })

			npairs.add_rules({
				-- markdown stuff
				-- italics
				Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
				Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
				-- bold --
				Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
				Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
			})
			npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
			npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
			npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- FIXME this seems to throw an error when starting [] inside a .editorconfig
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	},

	{
		"ur4ltz/surround.nvim",
		event = "VeryLazy",
		opts = {
			mappings_style = "surround",
		},
	},

	{
		"Wansmer/sibling-swap.nvim",
		dependencies = { "nvim-treesitter" },
		event = "BufRead",
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{"<C-.>", "<cmd>lua require('sibling-swap').swap_with_right()<CR>", {noremap = true, silent = true, desc = "Swap Sibling with Right"}},
			{"<C-,>", "<cmd>lua require('sibling-swap').swap_with_left()<CR>", {noremap = true, silent = true}, desc = "Swap Sibling with Left"},
			-- FIXME figure out how this is supposed to work
			-- {"<leader>.>", "<cmd>lua require('sibling-swap').swap_with_right_with_opp()<CR>", {noremap = true, silent = true, desc = "Swap Sibling Right Separator for Opposite Value"}},
			-- {"<leader>,", "<cmd>lua require('sibling-swap').swap_with_left_with_opp()<CR>", {noremap = true, silent = true}, desc = "Swap Sibling Left Separator for Opposite Value"},
		}
	},


	-- toggling comments
	{
		"tpope/vim-commentary",
		on = "VeryLazy"
	},


}
