local api = vim.api

-- ruby things with different endings
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"Dangerfile",
		"Brewfile",
		"*.Brewfile",
		"Capfile",
		"Thorfile",
		"*.god",
		"*.ru",
		".caprc",
		"*.rbi",
	},
	command = "set filetype=ruby",
})

vim.g.vim_markdown_edit_url_in = 'current'

-- dockerignore is  close enough to gitignore
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { ".dockerignore" },
	command = "set filetype=gitignore",
})

api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function ()
		vim.keymap.set("n", "gf", "<Plug>Markdown_EditUrlUnderCursor", {noremap = true, silent = true})
	end
})
