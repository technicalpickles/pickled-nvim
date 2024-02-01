-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
-- see various issues on community ie https://github.com/community/community/discussions/16298
local copilot_node_command
if vim.fn.filereadable("/opt/homebrew/opt/node@20/bin/node") == 1 then
	copilot_node_command = "/opt/homebrew/opt/node@20/bin/node"
elseif vim.fn.filereadable("/usr/local/opt/node@20/bin/node") == 1 then
	copilot_node_command = "/usr/local/opt/node@20/bin/node"
end

return {
	{
		"zbirenbaum/copilot.lua",
		enabled = require("pickled-nvim").enabled("zbirenbaum/copilot.lua"),
		event = "InsertEnter",
		opts = {
			ft_disable = require("pickled-nvim").filetype_config.copilot.disable,

			-- suggested to disable these when using with cmp
			suggestion = { enabled = false },
			panel = { enabled = false },

			copilot_node_command = copilot_node_command
		},
		cmd = "Copilot",
		config = function(_, opts)
			require("copilot").setup(opts)
		end,

		command_center = {
			{ desc = "Copilot: Setup", cmd = "<CMD>Copilot setup<CR>" },
			{ desc = "Copilot: Signout", cmd = "<CMD>Copilot signout<CR>" },
			{ desc = "Copilot: Disable", cmd = "<CMD>Copilot disable<CR>" },
			{ desc = "Copilot: Enable", cmd = "<CMD>Copilot enable<CR>" },
			{ desc = "Copilot: Status", cmd = "<CMD>Copilot status<CR>" },
			{ desc = "Copilot: Panel", cmd = "<CMD>Copilot panel<CR>" },
			{ desc = "Copilot: Version", cmd = "<CMD>Copilot version<CR>" },
			{ desc = "Copilot: Feedback", cmd = "<CMD>Copilot feedback<CR>" },
		},
	},

	{
		"zbirenbaum/copilot-cmp",
		enabled = require("pickled-nvim").enabled("zbirenbaum/copilot-cmp"),
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
