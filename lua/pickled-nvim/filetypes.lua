 local api = vim.api
 
  -- ruby things with different endings
api.nvim_create_autocmd(
    {"BufRead","BufNewFile"},
	{
		pattern = {
			"Dangerfile",
			"Brewfile",
			"*.Brewfile",
			"Capfile",
			"Thorfile",
			"*.god",
			"*.ru",
			".caprc",
		},
		command = "set filetype=ruby"
	}
)

-- dockerignore is  close enough to gitignore

api.nvim_create_autocmd(
	{"BufRead","BufNewFile"},
	{
		pattern = { ".dockerignore" },
		command = "set filetype=gitignore"
	}
)
