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
}
