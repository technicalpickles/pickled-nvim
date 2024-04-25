local silent_noremap = { noremap = true, silent = true }
local enabled = require("pickled-nvim").enabled

return {
	{
		"kyoh86/vim-ripgrep",
		enabled = enabled("kyoh86/vim-ripgrep"),
		cmd = "Rg",
		config = function()
			vim.cmd([[
				command! -nargs=+ -complete=file Rg :call ripgrep#search(<q-args>)
			]])
		end,
		keys = {
			{ "<leader>F", ":Rg ", silent_noremap },
			{ "<D-F>", ":Rg ", silent_noremap },
		},
	},

	{
		"mangelozzi/rgflow.nvim",
		enabled = enabled("mangelozzi/rgflow.nvim"),
		opts = {
			-- Set the default rip grep flags and options for when running a search via
			-- RgFlow. Once changed via the UI, the previous search flags are used for
			-- each subsequent search (until Neovim restarts).
			cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",

			-- Mappings to trigger RgFlow functions
			default_trigger_mappings = true,
			-- These mappings are only active when the RgFlow UI (panel) is open
			default_ui_mappings = true,
			-- QuickFix window only mapping
			default_quickfix_mappings = true,
		},
	},
}
