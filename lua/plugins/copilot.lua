return {
	{
		'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					ft_disable = require("pickled-nvim").filetype_config.copilot.disable,

					-- suggested to disable these when using with cmp
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end, 100)
		end,
	},

	{
		'zbirenbaum/copilot-cmp',
		dependencies = {'copilot.lua'},
		lazy = true,
		config = function ()
			require("copilot_cmp").setup {
				method = "getCompletionsCycling",
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			}
		end
	},
}
