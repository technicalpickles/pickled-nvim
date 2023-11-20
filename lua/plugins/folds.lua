local silent_noremap = { noremap = true, silent = true }
return {
	-- folds
	{
		"kevinhwang91/nvim-ufo",
		enable = require("pickled-nvim").enabled("kevinhwang91/nvim-ufo"),
		opts = {
			-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
		keys = {
			-- FIXME: error loading lua string, '=' expected near '<eof>', but works fine when used directly
			{
				"K",
				"<CMD>lua require('pickled-nvim.folds').peekOrHover()<CR>",
				{ buffer = 0, noremap = false, silent = true },
			},

			{ "zR", "<CMD>lua require('ufo').openAllFolds()<CR>", silent_noremap },
			{ "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>", silent_noremap },

			{ "<D-M-[>", "zf", silent_noremap },
			{ "<D-M-]>", "zo", silent_noremap },
		},
		event = "BufRead",
		dependencies = "kevinhwang91/promise-async",
	},
}
