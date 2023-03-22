local silent_noremap = { noremap = true, silent = true }
return {
	{
		"mhinz/vim-grepper",
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
