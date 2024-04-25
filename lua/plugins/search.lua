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
		"mhinz/vim-grepper",
		enabled = false,
		cmd = "Grepper",
		keys = {
			{ "<leader>F", ":Grepper<CR>", silent_noremap },
			{ "<D-F>", ":Grepper<CR> ", silent_noremap },
		},
		config = function()
			vim.g.grepper = {
				tools = { "rg", "ag", "pt", "git", "sift" },
				highlight = 1,
				prompt = 1,
				prompt_text = " $t> ",
				next_tool_mapping = "<tab>",
				rg = {
					grepprg = 'rg -H --no-heading --vimgrep --hidden --glob "!.git" --glob "!node_modules"',
				},
			}
		end,
	},
}
