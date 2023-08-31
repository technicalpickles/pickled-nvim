local g = vim.g
return {
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {
			sign_priority = require("pickled-nvim").sign_priorities.mark,
		},
		command_center = {
			{ desc = "Marks: List in Current Buffer", cmd = "<CMD>MarksListBuf<CR>" },
			{ desc = "Marks: List Globally", cmd = "<CMD>MarksListGlobal<CR>" },
		},
	},

	{
		"sickill/vim-pasta",
		event = "VeryLazy",
		config = function()
			g.pasta_disabled_filetypes = require("pickled-nvim").filetype_config.pasta.disable
		end,
	},

	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},

	{
		"Wansmer/treesj",
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{ "gS", "<CMD>TSJSplit<CR>" },
			{ "gJ", "<CMD>TSJJoin<CR>" },
		},
		command_center = {
			{ desc = "SplitJoin: Split", cmd = "<CMD>TSJSplit<CR>" },
			{ desc = "SplitJoin: Join", cmd = "<CMD>TSJJoin<CR>" },
		},
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
			local not_inside_code_block =
				ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })

			npairs.add_rules({
				-- markdown stuff
				-- italics
				Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
				Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
				-- bold --
				Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
				Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
			})
			npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- FIXME this seems to throw an error when starting [] inside a .editorconfig
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
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
			{
				"<C-.>",
				"<cmd>lua require('sibling-swap').swap_with_right()<CR>",
				{ noremap = true, silent = true, desc = "Swap Sibling with Right" },
			},
			{
				"<C-,>",
				"<cmd>lua require('sibling-swap').swap_with_left()<CR>",
				{ noremap = true, silent = true },
				desc = "Swap Sibling with Left",
			},
			-- FIXME figure out how this is supposed to work
			-- {"<leader>.>", "<cmd>lua require('sibling-swap').swap_with_right_with_opp()<CR>", {noremap = true, silent = true, desc = "Swap Sibling Right Separator for Opposite Value"}},
			-- {"<leader>,", "<cmd>lua require('sibling-swap').swap_with_left_with_opp()<CR>", {noremap = true, silent = true}, desc = "Swap Sibling Left Separator for Opposite Value"},
		},
	},

	-- toggling comments
	{
		"numToStr/Comment.nvim",
		opts = {},
		event = "BufRead",
	},

	-- make . work in more places
	{
		"tpope/vim-repeat",
		event = "BufRead",
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},

		command_center = {
			{
				desc = "Flash: Toggle",
				cmd = function()
					require("flash").toggle()
				end,
			},
		},
	},
}
