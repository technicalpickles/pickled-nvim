return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			ft_disable = require("pickled-nvim").filetype_config.copilot.disable,

			-- suggested to disable these when using with cmp
			suggestion = { enabled = false },
			panel = { enabled = false },

			-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
			-- see various issues on community ie https://github.com/community/community/discussions/16298
			copilot_node_command = "/opt/homebrew/opt/node@16/bin/node",
		},
		cmd = "Copilot",
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		lazy = true,
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			})
		end,
	},
}
